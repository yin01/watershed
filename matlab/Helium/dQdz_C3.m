

function y=dQdz_C3(z,Q)
  
C=3.;

y=dnphot_dz(z)- R_u(z,Q).*Q.*C;

