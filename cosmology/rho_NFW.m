% dark matter density in (M_solar h^-1) (kpc h^-1)^-3 
% give r in kpc h^-1, M in M_solar h^-1

function y=rho_NFW(r,M) 

  rho_crit=277.3; 
  r200=r200_func(M); 
  c_NFW=c_NFW_fit(M);
  rs=r200/c_NFW;
  x=r./rs;

  delta_o=200./3.*(c_NFW.^3)./(log(1+c_NFW)-c_NFW./(1+c_NFW));

  y=rho_crit.*delta_o./x./((1+x).^2);