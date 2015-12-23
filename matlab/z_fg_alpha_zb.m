

%%%% this gives the foreground Ly-alpha redshift from the z_beta redshift

function y=z_fg_alpha_zb(zb)
  
y=(1026./1216.*(1+zb))-1.;