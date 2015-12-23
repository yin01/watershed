%%% This makes a spline of f_collapse as a function of cosmic time t (in
%yr)
%%% for fixed R


function make_spline_f_collapse(zmin,zmax,delta,R)
global f_coll_spline_coeff

z=linspace(zmin,zmax);

t=time_t(z);

lgt=log(t);


%sigM=sigmaM_spline(M);
%sigMmin=sigmaM_spline(Mmin);

%zfac=(delta_crit(z)-delta)./sqrt(2.*(sigMmin.^2-sigM.^2));
%lgt=log(zfac);

lgf_coll=log(f_collapse_delta(delta,R,z));
f_coll_spline_coeff=spline(lgt,lgf_coll);


