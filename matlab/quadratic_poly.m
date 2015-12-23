%%%% This is just a quadratic polynomial to be used by the curve-fitting
%program

function y=quadratic_poly(x,xdata)
  
y=x(1)+x(2).*xdata+x(3).*(xdata.^2); %%%+x(4).*(xdata.^3);

%%%y=x(1)*xdata.^2 + x(2)*sin(xdata) + x(3)*xdata.^3;
