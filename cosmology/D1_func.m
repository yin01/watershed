%%%% This is the growth factor renormalization to the epoch of
%matter-radiation equality


function y=D1_func(z)
cosmological_parameters

theta=2.728./2.7;
zeq=2.5e4.*Omega_m.*h.*h/(theta.^4);

y=(1+zeq).*growth_factor(z);

