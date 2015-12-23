%%%% This is the B_o fit to delta_x
%%% M is in M_solar

function y=B_o_func(z)
FHZ_parameters

M=mass_from_Tvir(1.e4,z);
sigMmin=sigmaM_spline(M);
y=delta_crit(z)-sqrt(2).*K_global.*sigMmin;