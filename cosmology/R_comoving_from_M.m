%%% This gives the comoving radius in Mpc
%%% if the mass is input in M_solar 

%%% 12 March 2005: Corrected a BIG mistake: was using rho_crit, not
%rho_mass, for the comoving mass density---off by a factor Omega_m

function y=R_comoving_from_M(M)
cosmological_parameters
  

rhs=4./3.*pi*rho_m_comoving;  
y=(M./rhs).^0.33333;
