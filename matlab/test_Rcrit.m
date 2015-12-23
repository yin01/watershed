 
%%initialize_everything_reion; 
 
%%%% This tests the critical radius

z=10.;
%%%x_ion=0.99;

%%%zeta=zeta_from_x_ion(x_ion,z)
zeta=10.;
reinitialize_FHZ(zeta);

R=Rcrit_recomb(zeta,z)

%%stop

gam=gamma_from_R_zeta(R,zeta,z);

xHI_bubble=xHI_from_gamma(gam,z,0,0)

mass=mass_from_R_comoving(R);
delta_real=delta_from_mfp(R,z).*(1+delta_x(mass,z)./(1+z));

xHI=xHI_equil(gam,delta_real,z,0)


tau=tau_eff_R_gamma(R,gam,z)

