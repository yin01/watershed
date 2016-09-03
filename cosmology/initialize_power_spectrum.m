%%%% This is a function which initializes the power spectrum
%%% By fixing Ao_PS

function y=initialize_power_spectrum
cosmological_parameters

Ao_PS=1.; %initialize dummy normalization constant

rho=rho_m_comoving / (h*h*h);  %%% this has units of M_solar Mpc^-3 h^3
Mass=4./3.*pi*rho*(8.^3);

test_sigma=sigmaM_full(Mass);
Ao_PS=(sigma8/test_sigma).^2;
