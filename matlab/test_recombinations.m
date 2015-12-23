
z=6.;
x_ion=0.49;

zeta=zeta_from_x_ion(x_ion,z)
reinitialize_FHZ(zeta);

R=logspace(0,2);

%recomb=recomb_R(zeta,z,R);
%reion=reion_R(zeta,z,R);

semilogx(R,recomb,'red',R,reion)
shg

M=mass_from_R_comoving(R);
delta=delta_x(M,z);

f_c=f_collapse_delta(delta,R,z);


