function pixelList = fof(boxName,pixDim,phyDim,connComp)
%FOF gives the bubble size distribution using friend-of-friend segmentation
%The binary map is created by imposing that a pixel is ionized if and only
%if it is completely ionized, else it is neutral. No partial ionization is 
%allowed.
%
%
%FOF(BOX NAME, PIXEL DIMENSION, PHYSICAL DIMENSION, CONNECTED COMPONENT)
%connected component has to be 6,18,or 26 for 3D box
%


%read file and impose ionization condition
HII_file = fopen(boxName);
HII_box = fread(HII_file,'single');
HII_box = reshape(HII_box, pixDim, pixDim, pixDim);
box = HII_box > 0;
box = (box == 0);

%finding connected component
CC = bwconncomp(box, connComp);
s = regionprops(CC,'Area');

pixelList = [];
for i=1:numel(s)
    pixelList = [pixelList, s(i).Area];
end

pixelList = (double(phyDim) / double(pixDim))*((3/4)*(pixelList/pi)).^(1/3);
end 