
%%%% EVERYTHING in cgs units
function y=v_shock(E,z,delta,r)
cosmological_parameters
  
rho=Omega_b*rho_crit_cgs*((1+z).^3)*delta;  
y=sqrt(0.35*E./rho./(r.^3));

  