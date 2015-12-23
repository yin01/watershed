

function y=dQdz_LLS_C1(z,Q)
  
C=1.;

y=dnphot_dz(z)*((1-Q)) - R_u(z,Q).*Q.*C;

