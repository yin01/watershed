%%% This gives the comoving volume in Mpc^3
%%% from mass in M_solar

function y=V_comoving_from_M(M)
cosmological_parameters

rho=rho_m_comoving;  %%% this is rho in straight units of M_solar Mpc^-3
		   %%% if in M_solar Mpc^-3 h^3, then rho=2.684/h
y=(M./rho);
