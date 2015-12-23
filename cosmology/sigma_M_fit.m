%%% this uses M as M_solar, NOT M_solar h^-1

function y=sigma_M_fit(M)
cosmological_parameters

M_solarh=M.*h;

y=sigma_M(M_solarh);