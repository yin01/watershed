
%%% spline fit to f_collapse

function y=f_collapse_spline(z)
global f_coll_spline_coeff 
  
logt=log(time_t(z));

y=exp(fnval(f_coll_spline_coeff,logt));
