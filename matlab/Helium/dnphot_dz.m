
%%% this gives dnphot_dz for Helium photons from fit to Hopkins

function y=dnphot_dz(z)
global pp_d_nphot_g

y=fnval(pp_d_nphot_g,z);

