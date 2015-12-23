
%% this is a test of the integral

function y=standard_integral(x1,x2)

lower=log(x1);
upper=log(x2);
  
y=quadl(@standard_integral_func,lower,upper);

function y=standard_integral_func(lgx)
  
x=exp(lgx);

b=0.5;
a=0.1881;
  
 y=x.*x.^(-b)./(1+a.*x);