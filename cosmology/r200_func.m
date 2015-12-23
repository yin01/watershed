function r200=r200_func(m200) % input m200 in M_solar h^-1
             % returns r200 in kpc h^-1
cosmological_parameters
  M_cgs=m200*2.e33;
 
 
  r200=(3.*M_cgs./(4.*pi.*1.99e-29.*200)).^0.33333333333;
  r200=r200./3.e21; % convert to kpc h^-1
