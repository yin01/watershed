function y=Gamma_rad_from_delta(delta,z)
cosmological_parameters
  
lambda=mfp_from_delta(delta);
a=1./(1+z);
H=H_a(a).*100.*h;
lambda_Mpc=lambda./H;
emissivity=global_recombination_rate(delta);
y=Gamma_rad_field(emissivity,lambda_Mpc,z);