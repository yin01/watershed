%%%% This gives the value of a lognormal distribution at a point x
%%%% which has a mean xbar and a dispersion in log(x) of sigma_logx

function y=lognormal_dist(x,xbar,sigma_logx)

  
m=log(xbar);
s=sigma_logx;

y=1./(x.*s.*sqrt(2.*pi)).*exp(-0.5.*(((log(x)-m)./s).^2));
  
 