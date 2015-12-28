# Watershed
---------------------------------------------
watershed segmentation of ionized bubbles

Cosmology and matlab folders are used for calculating excursion set. Cosmological and other parameters can be changed in cosmology folder. 
As an example to initialize excursion set, add both folders to matlab path and 

```
initialize_cosmology;
initialize_sigmaM_spline;
initialize_FHZ;
z =11    %redshift
R =10    %in Mpc
M = mass_from_R_comoving(R);
y = dNdM_FHZ(M,z);
```

In analyze folder, concaveSitk.py is the main file that performs watershed segmentation to the ionized box generated by 21cmFAST. SimpleITK
has to be installed (http://www.simpleitk.org/). Note that all programs convert the existing grey-scale box to binary box 
(as required by watershed) by imposing that a pixel is ionized if and only if it is completely ionized, else it is neutral.
