

function y=integral_compare(x1,x2)
  
y=integral_compare_func(x2)-integral_compare_func(x1);

function y=integral_compare_func(x)

b=0.5;
a=0.1881;

y=-((x).^(1-b)).*hypergeom([1-b,1],2-b,-a.*x)./(b-1);