
function y=d_M_spline(z)
cosmological_parameters

lg_1z=log(1+z);

y=exp(ppval(lg_1z,splinefit_d_M));
