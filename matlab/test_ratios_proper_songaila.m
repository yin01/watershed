%%%% This tests the ratio of optical depths for the proper calculation
%and for the Songaila approximation

gamma=0.05;
z=6.;

ratio_proper=log(transmitted_flux_gamma(gamma,z,1))./ ...
		 log(transmitted_flux_gamma(gamma,z,2))

ratio_songaila=log(transmitted_flux_songaila(gamma,z,1))./ ...
		 log(transmitted_flux_songaila(gamma,z,2))

ratio_approx_songaila=ratio_taus_songaila(gamma,z)
