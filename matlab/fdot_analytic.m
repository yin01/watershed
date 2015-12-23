%%% This gives an analytic expression for fdot
%%% R is in comoving Mpc

function y=fdot_analytic(delta,z,R)
  
M=mass_from_R_comoving(R);
Mmin=mass_from_Tvir(1.e4,z);

sigM=sigmaM_spline(M);
sigMmin=sigmaM_spline(Mmin);

zfac=(delta_crit(z)-delta)./sqrt(2.*(sigMmin.^2-sigM.^2));

fac1=2./sqrt(pi).*exp(-zfac.^2);
fac2=delta_crit(z)./(1+z)./sqrt(2.*(sigMmin.^2-sigM.^2)).*dzdt(z);



y=fac1.*fac2;