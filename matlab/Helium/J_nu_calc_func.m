function y=J_nu_calc_func(z)
global z_o_g E_o_g

z_factor=((1+z_o_g)./(1+z)).^3;  
E_now=E_o_g.*(1+z)./(1+z_o_g);
  
y=dldz(z).*z_factor.*emissivity_hopkins(E_now,z).*exp(- ...
						  tau_HI_analytic(z_o_g,z,E_o_g));

y=y.*1.e-24;   %% make it close to unity so the integrator is happy

