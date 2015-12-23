function dist = dist_transform(boxName, pix_dim, phy_dim)
%DIST_TRANSFORM takes in the ionized box produced by 21cmFAST; creates a
%binary ionization map by imposing that a pixel is ionized if and only
%if it is completely ionized, and all other are neutral; then lastly
%return the closestly Euclidean distance to a neutral pixel for every
%ionized pixel
%
%
%MEAN_FREE_PATH(BOXNAME, PIXEL DIMENSION, PHYSICAL DIMENSION)

HII_file = fopen(boxName);
HII_box = fread(HII_file,'single');
HII_box = reshape(HII_box, pix_dim, pix_dim, pix_dim);
HII_box = HII_box > 0;

%for debugging
%ion = sum(HII_box(:))/pix_dim^3

dist = bwdist(HII_box);
dist = dist(:);
dist = dist (dist ~= 0);
dist = dist * (phy_dim /pix_dim);
end

