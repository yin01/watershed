%%% This gives mass in M_solar
%%% from  the comoving volume in Mpc^3 

function y=M_from_V_comoving(V)
cosmological_parameters

rho=Omega_m.*2.684e11*h*h;  %%% this is rho in straight units of M_solar Mpc^-3
		   %%% if in M_solar Mpc^-3 h^3, then rho=2.684/h
y = V .* rho;
