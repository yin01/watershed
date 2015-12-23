%%% find the uniform radiation field gamma given the recombination rate
%per baryon per Hubble time
%%% gamma is in units of 10^-12 s^-1

function y=gamma_from_recombination_rate(R,z)
global R_GR z_GR

nR=length(R);
y=zeros(size(R));

%%%% initialize globals

z_GR=z;

lower=log(1.e-20);
upper=log(1.e-12);

for i=1:nR
  i
  R_GR=R(i);
  y(i)=exp(fzero(@gamma_GR_func,[lower upper]));  
end




function y=gamma_GR_func(lggam)
global R_GR z_GR

gam=exp(lggam);

y=1.-rec_rate_from_gamma(gam,z_GR)./R_GR;

