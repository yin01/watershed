%%% This computes the collapse rate given zeta and redshift z
%%% at over a fixed lengthscale R (in comoving Mpc)
%% It first fits a spline to fdot and then differentiates that

%% has units of yr^-1

function y=fdot_collapse(zeta,R,z)
  
zmin=z-1;
zmax=z+1;

M=mass_from_R_comoving(R);
reinitialize_FHZ(zeta);
delta=delta_x(M,z);

make_spline_f_collapse(zmin,zmax,delta,R);

y=fdot_spline(z);
