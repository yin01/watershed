%% This tests the effect of varying delta_exp on the ratio of tau_eff 
%%% for different lines

z=6.24;

flux=0.0012;

gamma=gamma_from_flux(flux,z,1)

ratio_tau1=log(transmitted_flux_gamma(gamma,z,1))./ ...
		 log(transmitted_flux_gamma(gamma,z,3))

delta_exp=3;
gamma2=gamma_from_flux2(flux,z,1,delta_exp)
ratio_tau2=log(transmitted_flux_gamma2(gamma,z,1,delta_exp))./ ...
		 log(transmitted_flux_gamma2(gamma,z,3,delta_exp))