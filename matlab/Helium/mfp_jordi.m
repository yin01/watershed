function y=mfp_jordi(tau_max)
  
lower=0.;
upper=tau_max;

y=quadl(@mfp_jordi_func,lower,upper);


function y=mfp_jordi_func(tau)
 
y=(tau.^(-1.5)).*(1.-exp(-tau));

