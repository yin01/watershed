

function y=dQdz_C1(z,Q)
  
C=1.;

y=dnphot_dz(z)- R_u(z,Q).*Q.*C;

