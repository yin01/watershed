%%% This gives the mean free path in PHYSICAL units
%%%% in Mpc (PROPER)

function y=mfp_delta_physical(delta,z)
cosmological_parameters
  
a=1./(1+z);
Hz=H_a(a).*100.*h;
y=mfp_delta(delta,z)./Hz;