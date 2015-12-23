
%% He II ---> III photoionization cross section
% E is photon energy in eV

function y=sigma_He_ionization(E)
  
x=(E./54.4).^(-3);

y=1.91e-18.*x;

