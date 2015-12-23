
%%% this computes the optical depth contribution from a uniform
%neutral%IGM

%%% R  is in PROPER Mpc

function y=tau_IGM_He(E,r,z)
He_parameters

n_He=n_He_comoving.*((1+z).^3);

y=n_He.*sigma_He_ionization(E).*(r.*3.e24);

