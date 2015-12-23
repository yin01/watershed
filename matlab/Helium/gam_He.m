%%% this solves for the radiation field for He as a function of redshift  

function y=gam_He(z)
global z_g_He 

nz=length(z);
y=zeros(size(z));

lower=log(1.e-16);
upper=log(1.e-13);


for i=1:nz
  z_g_He=z(i);
  y(i)=exp(fzero(@gam_He_func,[lower upper]));  
end
  
function y=gam_He_func(lggam)
global z_g_He

gam=exp(lggam);
y=transmit_flux_He(gam,z_g_He,2)-exp(-tau_eff_He(z_g_He));