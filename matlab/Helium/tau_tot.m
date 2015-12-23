
%%% this gives the total contribution to tau 
%%% r_ion is the size of the HII region which is ionized
%% Q is the filling factor of ionized regions

function y=tau_tot(E,r,r_ion,Q,z)
  
y=(1-Q).*tau_IGM_He(E,r-r_ion,z) + tau_eff_He_LLS(r,E,z);

