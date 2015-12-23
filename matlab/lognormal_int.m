
function y=lognormal_int(lgx)
global xbar_global lgsigma_global

x=exp(lgx);

y=x.*lognormal_dist(x,xbar_global,lgsigma_global);