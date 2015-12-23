%%% This finds the characteristic bubble size in the FHZ model
%%%  Assuming that there are no recombinations

function y=Rstar_FHZ(z);
global z_g_Rstar  

nz=length(z);
y=zeros(size(z));


lgR1=log(1.);
lgR2=log(20.);
  
for i=1:nz

z_g_Rstar=z(i);
y(i)=exp(fminbnd(@Rstar_FHZ_func,lgR1,lgR2));  
  
end

function y=Rstar_FHZ_func(lgR)
global z_g_Rstar
FHZ_parameters
  
z=z_g_Rstar;
R=exp(lgR);
M=mass_from_R_comoving(R);
V=V_comoving_from_M(M);
Q=Q_filling_factor(z);
dNdlnR=M.*dNdM_FHZ(M,z).*3.*V./Q;

y=-abs(dNdlnR);