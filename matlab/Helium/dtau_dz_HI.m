
%%% this is expression for HI only

function y=dtau_dz_HI(z1,z2,E)
global E_g z_g
 
z_g=z2;
E_g=E./(1+z1).*(1+z2);
  
y=quadl(@dtau_dz_func,log(1.e14),log(1.e22));
  
function y=dtau_dz_func(lgN)
global z_g E_g
  
N_HI=exp(lgN);

a2=exp(-N_HI.*sigma_HI(E_g));

%%y=N_HI.*fN_single_power_law(N_HI,z_g).*(1-a2);

tau=N_HI.*sigma_HI(E_g);

factor=tau./(1+0.75.*tau);

y=N_HI.*fN_single_power_law(N_HI,z_g).*factor;


