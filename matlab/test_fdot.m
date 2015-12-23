%%% This tests whether the expression for fdot is good or not...

R=10.;
M=mass_from_R_comoving(R);

zmin=5.;
zmax=10.;

delta=delta_x(M,z);
make_spline_f_collapse(zmin,zmax,delta,R);


z=linspace(7,9);
t=time_t(z);

fdot1=fdot_spline(z);


delta=delta_x(M,z);
fdot2=diff(f_collapse_delta(delta,R,z))./diff(t);

tsmall=t(2:end);

plot(t,fdot1,tsmall,fdot2)
shg



