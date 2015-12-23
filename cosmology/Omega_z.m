function y=Omega_z(z)
cosmological_parameters
  
top=Omega_m*((1+z).^3);
bottom=Omega_lambda+Omega_k*((1+z).^2)+Omega_m*((1+z).^3);

y=top./bottom;
