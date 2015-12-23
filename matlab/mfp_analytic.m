%%% This gives the analytic approx to the mean free path 
%%% in Mpc (PROPER)

%%% alpha is the logarithmic slope (alpha=2 for isothermal)

function y=mfp_analytic(delta,z,alpha)
  
zfactor=(1+z)./7.;
  
y=3.0.*((0.1.*delta).^(2./alpha)).*(zfactor.^-1.5);