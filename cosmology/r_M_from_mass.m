%%%% This gives the initial comoving radius (in Mpc) from the mass (in
%M_solar)

function y=r_M_from_mass(M)
cosmological_parameters

y=(3.*M./(4.*pi.*rho_m_comoving)).^0.33333333333;
