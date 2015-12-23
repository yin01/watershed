function y=redshift_z(t)  %% time t is in years
cosmological_parameters

  Hubble_time=1.e10/h;

  factor=sqrt(Omega_m/(1.-Omega_m));
  arg=1.5*(t/Hubble_time)*sqrt(1.-Omega_m);
  y=(factor*sinh(arg)).^(-0.666667)-1.;