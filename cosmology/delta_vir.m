%%%%% This is the delta appropriate for the VIRIAL radius at redshift z

function y=delta_vir(z)
  
x=log(Omega_z(z));

y=1.5927.*(1.+x.*1.e-3.*(3.9-0.36.*x-0.09.*(x.^2)));