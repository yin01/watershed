
%%% this is expression for HeII only

function y=dtau_dz_HeII(z1,z2,E)
global E_g z_g
 
z_g=z2;
E_g=E./(1+z1).*(1+z2);
  
y=quadl(@dtau_dz_HeII_func,log(1.e12),log(1.e20));

  
function y=dtau_dz_HeII_func(lgN)
global z_g E_g
  
N_HI=exp(lgN);

a2=exp(-eta_fardal_spline(N_HI).*N_HI.*sigma_HeII(E_g));

y=N_HI.*fN_single_power_law(N_HI,z_g).*(1-a2);


