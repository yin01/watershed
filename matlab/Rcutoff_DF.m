%%% This finds the cutoff R below which the distribution function 
%%% becomes very small
%%% Note: do the full V/Q so that the normalization is sensible

function y=Rcutoff_DF(Rguess,DFmin,z)
global DFmin_global z_global

%%% initialize global variables

DFmin_global=DFmin;
z_global=z;
  
lgRguess=log(Rguess);
y=exp(fzero(@Rcutoff_DF_func,lgRguess));  
  
  
function y=Rcutoff_DF_func(lgR)
global DFmin_global z_global

R=exp(lgR);
mass=mass_from_R_comoving(R);
V=V_comoving_from_M(mass);
DF=V_comoving_from_M(mass).*mass.*dNdM_FHZ(mass,z_global).*3/ ...
   Q_filling_factor(z_global);

y=DF-DFmin_global;

