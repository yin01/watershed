function y=delta_crit(z)
%{
cosmological_parameters
  
  om=Omega_z(z);
  
  if (Omega_k==0)
    p=0.055;
  else
    p=0.0185;
  end
  
  y=0.15.*((12*pi)^0.6667).*(om.^p);
  
%%%  y=1.686.*(Omega_z(z).^p);
y=y./growth_factor(z);
%}

y=1.686./growth_factor(z);