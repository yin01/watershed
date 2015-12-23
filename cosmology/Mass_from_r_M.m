%%%% This gives the mass in M solar from the comoving radius in Mpc

function y=Mass_from_r_M(r_M)
cosmological_parameters


y=(4.*pi.*rho_m_comoving).*(r_M.^3)./3;