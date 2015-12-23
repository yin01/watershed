%%%% This is the collapse fraction on a fixed comoving scale
%%% R is in comoving Mpc
%%% delta

function y=f_collapse_delta(delta,R,z)

M=mass_from_R_comoving(R);
Mmin=mass_from_Tvir(1.e4,z);

sigM=sigmaM_spline(M);
sigMmin=sigmaM_spline(Mmin);

zfac=(delta_crit(z)-delta)./sqrt(2.*(sigMmin.^2-sigM.^2));

y=erfc(zfac);