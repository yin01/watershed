
%%% This is spline fit to fdot (in yr^-1)

function y=fdot_spline(z)
global f_coll_spline_coeff

lgt=log(time_t(z));

y=fnval(fnder(f_coll_spline_coeff,1),lgt).*f_collapse_spline(z)./ ...
  time_t(z);

