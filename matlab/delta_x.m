%%%% This is the exact expression for the FHZ barrier

function y=delta_x(m,z)
FHZ_parameters
  
Mmin=mass_from_Tvir(1.e4,z);
sigMminsq=(sigma_M(Mmin).^2);
sigMsq=(sigma_M(m).^2);
y=delta_crit(z)-sqrt(2.).*K_global.*sqrt(sigMminsq-sigMsq);

