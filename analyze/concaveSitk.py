# -*- coding: utf-8 -*-
"""
Created on Sun Aug 31 17:17:16 2014

@author: Yin Lin (yin01@uchicago.edu)

Watershed segmentation of 21cmFAST ionization box using distance trasnform and
h-minima transform.
"""

import numpy as np
import time
import scipy.ndimage
import SimpleITK as sitk
import tables
import scipy.special


def imextendedmin(image,h,fullyConn=True):
    """
    Return the extended minimum similar to the function of same name in matlab
    
    Keyword arguments:
    
    image     --- input image in SimpleITK image format
    h         --- h value to be imposed for h-minima trasnform
    fullyConn --- connectivity of pixels. True is 26-connectivity (cube) and 
                  false is 6-connectivity (cross) (Default: True)
    """
    return sitk.RegionalMinima(sitk.HMinima(image,h)
    ,fullyConnected=fullyConn)
    
def waterSeg(boxName,imgSize=100,imgDim=1000,h=1,fullyConn=True,
              saveName=None,distReturn=False):
    
    """
    Watershed segmentation of 21cmFAST ionization box. The function creates a 
    binary box using the condition that a pixel is ionized if and only if it 
    is completely ionized, else it is neutral. Then the box is smoothed by
    h-minima transform to find local minia seeds, then the seeds are passed to 
    the watershed algorithm to create segmented image
    
    Keyword arguments:
    
    boxName    --- input 21cmFAST ionization box name
    imgSize    --- physical box dimension (in Mpc)
    imgDim     --- box dimension in number of pixels
    h          --- h value for h-minima transform
    fullyConn  --- connectivity of pixels. True is 26-connectivity (cube) and 
                   false is 6-connectivity (cross) (Default: True)
    saveName   --- saveName for output watershed segmented box. Default name
                   is  saveName = 'seg' + boxName + '.h5' (h5 format)
    distReturn --- if true, the function returns the distance transform of 
                   original box (default: False)
                                   
    """
    if saveName == None:
        saveName = 'seg' + boxName + '.h5'

    print '> reading box...'
    start = time.time()
    BW = np.fromfile(boxName,dtype='float32')
    BW = np.resize(BW,(imgDim,imgDim,imgDim))
    BW = BW[:,:,:]
    print "box size: %d x %d x %d" %(np.shape(BW)[0],np.shape(BW)[1],np.shape(BW)[2])
    print 'finished in %s \n' %(-start+time.time())


    print '> finding distance transform...'
    start = time.time()
    #convert any non zero pixel value to 1 to create a binary
    BW = BW > 0;
    #invert the image so the bubbles are represented by 1's
    BW = np.invert(BW)   
    print 'ionization fraction : %.2f' %(np.sum(BW) / (500.0**3.0))
    #apply distance transform to the inverted binary image, BWInv
    #This calculate The Euclidean distance to the closest zero pixel
    feature = scipy.ndimage.morphology.distance_transform_edt(BW).astype(np.float32)
    print 'finished in %s \n' %(-start+time.time())

    if distReturn:
        dist = feature

    print '> finding extended minimums (h=%s)' %(h)
    start = time.time()
    #converting to simplitk image. I take the negative of distance transform
    #so bubbles will be represented by minima
    feature = sitk.GetImageFromArray(feature)
    feature = sitk.InvertIntensity(feature)
    
    #perform h-minima and found the seeds of local mimia for watershed
    markerImg = sitk.ConnectedComponent(imextendedmin(feature,h,
                                                   fullyConn=fullyConn),
                                    fullyConnected=fullyConn)
    print 'finished in %s \n' %(-start+time.time())
    
    print '> finding watershed'
    saveMarker = sitk.GetArrayFromImage(markerImg)
    saveMarker = saveMarker.astype('int64')
    start = time.time()
    feature = sitk.MorphologicalWatershedFromMarkers(feature,markerImg,
                                                    markWatershedLine=False,
                                                     fullyConnected=fullyConn)
    print 'finished in %s \n' %(-start+time.time())


    print '> sorting bubbles...'
    start = time.time()
    feature = sitk.GetArrayFromImage(feature)
    feature[np.where(BW==0)] = 0

    print 'number of bubbles found: %s' %np.max(feature)
    
    #calculate effective radii of each watershed region
    pixelList = np.bincount(np.ndarray.flatten(feature))
    #eliminate the background count
    pixelList = np.delete(pixelList,[0])
    pixelList = (float(imgSize)/float(imgDim)) * scipy.special.cbrt((3./4.)*(pixelList/np.pi))
    print 'finished in %s \n' %(-start+time.time())

    print '> saving...'
    start = time.time()
    h5file = tables.openFile(saveName, mode = "w", title = "Watershed")
    h5file.createArray(h5file.root,"water",BW)
    h5file.createArray(h5file.root,"pixelList",pixelList)
    h5file.close()

    if distReturn:
        h5file = tables.openFile('dist'+saveName, mode = "w", title = "Watershed")
        h5file.createArray(h5file.root,'dist',dist)
        h5file.createArray(h5file.root,'marker',saveMarker)
        h5file.close()
    print 'finished in %s \n' %(-start+time.time())

"""
#example setup
if __name__ == '__main__':
   boxName = ['xH_nohalos_z011.00_nf0.548238_eff40.0_HIIfilter1_Mmin7.3e+07_RHIImax30_500_500Mpc']
   boxPaths = ['../xH_nohalos_z011.00_nf0.548238_eff40.0_HIIfilter1_Mmin7.3e+07_RHIImax30_500_500Mpc']

   count = -1
   for boxPath in boxPaths:
       count += 1
       for h in [0.9]:
           sigma = 0
           print count
           print boxPath
           print boxName
           waterSeg(boxPath,h=h
                ,imgSize=500,imgDim=500,saveName= 'sitk_'+ boxName[count] + '_ch_' +
            str(h) + '.h5',distReturn=True,fullyConn=True)
"""