

function [N_HI fN_Zheng]=compute_fN_Zheng

r=logspace(-1,1.);

N_HI=NHI_column_Zheng(r);

B=2./(11.1^2);  %%% this normalization is so that the probability of
                %intersecting a halo within the virial radius is unity

fN_Zheng=abs(B.*r.*gradient(r,N_HI));

