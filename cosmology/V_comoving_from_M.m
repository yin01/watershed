%%% This gives the comoving volume in Mpc^3
%%% from mass in M_solar

function y=V_comoving_from_M(M)
cosmological_parameters

rho=rho_m_comoving;  %%% this rho is in units of M_solar Mpc^-3
		   
y=(M./rho);
