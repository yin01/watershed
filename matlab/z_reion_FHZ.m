%%%% This gives the redshift of reionization in the FHZ model
%%%% without recombinations

function y=z_reion_FHZ(zeta)
global zeta_common

nz=length(zeta);

for i=1:nz
  zeta_common=zeta(i);
  y(i)=fzero(@z_reion_FHZ_func,[4.,40.]);
end

function y=z_reion_FHZ_func(z)
global zeta_common

y=zeta_common.*f_collapse(z)-1.;
 