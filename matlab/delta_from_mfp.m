%%% This gives the overdensity delta up to which things are ionized, 
%%% given the mean free path 

%%% lambda --- in Mpc (comoving)

function y=delta_from_mfp(lambda,z)
global mfp_kms_global
cosmological_parameters

%%% Compute the mean free path in km s^-1

lambda_proper=lambda./(1+z); 
a=1./(1+z);
Hz=H_a(a).*100.*h;
mfp_kms_global=Hz.*lambda_proper;

%%% find the appropriate delta

lower=log(0.01);
upper=log(200.);

y=exp(fzero(@delta_from_mfp_func,[lower upper]));



function y=delta_from_mfp_func(lgdelta)
global mfp_kms_global
  
delta=exp(lgdelta);

y=mfp_kms_global./mfp_from_delta(delta)-1;