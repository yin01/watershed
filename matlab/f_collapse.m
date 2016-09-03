
%%% This gives the global collapse fraction above the critical mass
%%% with virial temperature T>1.e4

function y=f_collapse(z)
 
mass=mass_from_Tvir(1.e4,z);
  

sigMmin=sigmaM_spline(mass);

y=erfc(delta_crit(z)./(sqrt(2).*sigMmin));