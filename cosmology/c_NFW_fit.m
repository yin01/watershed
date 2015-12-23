%% ONLY VALID FOR LAMBDA CDM AT Z=0
%%% this is c200 and the mass is m200 in M_solar 
%%% fit to Eke et al (2001) for power spectrum with sigma_8=0.9 normalization
function y=c_NFW_fit(M) % mass is in M_solar 
cosmological_parameters  
  
%%%  m15=M/1.e15;
%%%%  y=8.5.*(m15.^(-0.086));
  
mvec=[1.e12 1.e13 1.e14 1.e15 1.e16];
cvec=[8.9 7.4 5.7 3.8 2.2];

lgmvec=log10(mvec);
lgm=log10(M);

y=spline(lgmvec,cvec,lgm);