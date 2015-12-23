%%% This is a fit for Gamma (in units of 10^-12 s^-1)
%%% from the Bullock et al stuff

function y=Gamma_Bullock_fit(z)
  
y=10.^(-0.24*z+0.4);