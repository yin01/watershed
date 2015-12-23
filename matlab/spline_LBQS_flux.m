%%% This is the spline fit to the LBQS data
%%% normalized to the value at 1280

function y=spline_LBQS_flux(lambda)
global LBQS_spline

y=ppval(LBQS_spline,lambda);


