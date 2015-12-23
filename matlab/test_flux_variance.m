%%%% this tests estimates of the variance in the flux at low redshift

gam=logspace(-2.5,-0.5);

z=6.*ones(size(gam));
nline=1;
delta_e=2.;
tau=abs(log(transmitted_flux_gamma2(gam,z,nline,delta_e)));

sig_tau=sigma_flux_gamma(gam,z,nline)./exp(-tau);

frac_tau=sig_tau/tau;

loglog(tau,frac_tau)
