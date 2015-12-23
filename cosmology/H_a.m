%% Hubble scaling as a function of scale factor

function y=H_a(a)
cosmological_parameters

y=sqrt(Omega_m.*(a.^(-3))+Omega_k.*(a.^(-2))+Omega_lambda);