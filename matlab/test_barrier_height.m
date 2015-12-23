%%%% march 5 2005: this obtains the barrier height as a function of R

z=6.;

R=logspace(-1,2.2);
mass=mass_from_R_comoving(R);

xHI=0.49;

zeta=zeta_from_xHI(xHI,z);

%%%zeta=40.;

reinitialize_FHZ(zeta);

delta_FHZ2=B_func(mass,z);

delta_FHZ=delta_x(mass,z);

%%%sigMsq=sigma_M(mass).^2;

semilogx(R,delta_FHZ)
%%%plot(sigMsq,delta_FHZ)
shg

