%%% This is the function I needed by the Gunn-Peterson routine

function y=I_GP(x)

y=(x.^4.5)./(1-x)+9/7.*(x.^3.5)+9/5.*(x.^2.5)+3.*(x.^1.5)+9.*(x.^0.5)- ...
  4.5.*log(abs((1+sqrt(x))./(1-sqrt(x))));
