

gamma_bar=0.02;
sig_lggamma=1.;
z=6.15;
delta_e=2.;

calc=0;

if calc==1

F_alpha=transmitted_flux_gamma_vary(gamma_bar,sig_lggamma,z,1, ...
				    delta_e);

F_beta=transmitted_flux_gamma_vary(gamma_bar,sig_lggamma,z,2, ...
				    delta_e);



tau_alpha=-log(F_alpha)
tau_beta=-log(F_beta)

ratio=tau_alpha./tau_beta;

%%% the value of gamma doesn't matter since it cancels out
gam_fake=0.05;

T_alpha=temperature_from_flux(F_alpha,z,gam_fake,1,delta_e);

T_beta=temperature_from_flux(F_alpha,z,gam_fake,2,delta_e);


T_ratio=T_alpha/T_beta

end

tau_alpha=-log(transmitted_flux_gamma2(gamma_bar,z,1,2))
tau_beta=-log(transmitted_flux_gamma2(gamma_bar,z,2,2))


ratio_tau=tau_alpha/tau_beta