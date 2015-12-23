%%%% This is a function which initializes the power spectrum
%%% By fixing Ao_PS

function y=initialize_power_spectrum
cosmological_parameters

Ao_PS=1.;

rho=(2.684e11/h)*Omega_m;
Mass=4./3.*pi*rho*(8.^3);

test_sigma=sigmaM_full(Mass);
Ao_PS=(sigma8/test_sigma).^2;
