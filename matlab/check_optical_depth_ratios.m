%%%% This checks the ratio of optical depths
global delta_exp

gam_ES=0.;
xi=0.;
delta_exp=2.-0.7*gam_ES-xi;
z=linspace(4.,6.,10);

%%%F=mean_flux_fit(z);

%%%z=5.7;
%%F=exp(-5);


%%%gamma=gamma_from_flux(F,z,1);

gamma=0.1.*ones(size(z));

flux_alpha=transmitted_flux_gamma(gamma,z,1);
tau_alpha=-log(flux_alpha);

flux_beta=transmitted_flux_gamma(gamma,z,2);
tau_beta=-log(flux_beta);

flux_gamma=transmitted_flux_gamma(gamma,z,3);
tau_gamma=-log(flux_gamma);

ratio1=tau_alpha./tau_beta;
ratio2=tau_alpha./tau_gamma;

plot(z,ratio1,z,ratio2)
shg
