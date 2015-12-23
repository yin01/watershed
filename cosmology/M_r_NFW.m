% Mass (in M_solar h^-1) as function of radius r (kpc h^-1)
% This is for variable parameters in NFW profile

function y=M_r_NFW(r,M)
cosmological_parameters 
  
  rho_crit=277.3; % in M_solar h^-1 /(kpc h^-1)^3
  r200=r200_func(M); % convert to kpc 
  
  
  c_NFW=c_NFW_fit(M);
 
  x=r./r200;
  rs=r200./c_NFW;
 
  delta_o=200./3.*(c_NFW.^3)./(log(1+c_NFW)-c_NFW./(1+c_NFW));
  factor=1./(1+c_NFW.*x)-1+log(1+c_NFW.*x);
    
  y=4.*pi.*rho_crit.*delta_o.*(rs.^3).*factor;

