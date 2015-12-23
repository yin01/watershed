%%% This gives the mass in M_solar
%%% From the radius in R (Mpc)

%%% 12 March 2005: Corrected a BIG mistake: was using rho_crit, not
%rho_mass, for the comoving mass density---off by a factor Omega_m

function y=mass_from_R_comoving(R)
cosmological_parameters

y=4./3.*pi*rho_m_comoving.*(R.^3);  
