%%%% This gives the neutral fraction from the strength of the radiation
%field

%%% gamma is given in 

function y=xHI_equil(gam,delta,z,gam_beta)
  

n=2.e-7.*((1+z).^3).*delta;

alpha_B=4.e-13;

A=1.16.*n.*alpha_B./(gam.*(delta.^gam_beta));

y=((2.*A+1)-sqrt(4.*A+1))./(2.*A);  %%%this expression from working out
                                    %the quadratic equation


%%%y=(-1+sqrt(1+4.*A))./(1+sqrt(1+4.*A));   % this equivalent expression
%from Fan et al 2002   for uniform radiation field case