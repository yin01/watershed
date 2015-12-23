%%% Collapse delta \approx 200 which depends on redshift

function y=Collapse_delta(z)
cosmological_parameters


d=Omega_z(z)-1.;
y=18.*pi.*pi +82.*d -39.*(d.^2);