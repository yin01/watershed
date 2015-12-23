
function y=xHI_Zheng_spline(r)
global xHI_Zheng_splinefit_g

lgr=log(r);

y=exp(ppval(xHI_Zheng_splinefit_g,lgr));
  
  
y(r<1.)=1.;
y(r>10.642)=1.182e-4.*((r(r>10.642)./10.642).^(-2));

