%%% This gives the collapsed mass fraction from M_min
%%% Mmin is in M_solar

function y=collapsed_mass_fraction(Mmin,z)
cosmological_parameters

nu=delta_crit(z)./(sqrt(2).*sigmaM_spline(Mmin));
y=erfc(nu);