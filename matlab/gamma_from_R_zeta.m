%%%% This gives the radiation field gamma (in units of 1.e-12 s^-1)
%%%% R is in COMOVING Mpc

function y=gamma_from_R_zeta(R,zeta,z)

R_proper=R./(1+z).*3.e24;
sigma_o=6.3e-18;
eta=1.5; %%% eps \propto nu^(-eta-1)
ne=2.e-7.*((1+z).^3);

y=R_proper.*sigma_o.*eta./(3+eta).*zeta.*ne./1.16.*fdot_collapse(zeta,R,z)/3.e7;

