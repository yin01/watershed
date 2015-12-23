%%%% This routine initializes the bubble size for the spline fit

function initialize_spline_bubble_size(z,Rmin,Rmax)
FHZ_parameters
  
R=logspace(log10(Rmin),log10(Rmax));
lgR=log(R);
M=mass_from_R_comoving(R);

V=V_comoving_from_M(M);
Q=Q_filling_factor(z);
dNdlnR=log(M.*dNdM_FHZ(M,z).*3.*V./Q);

splinefit_bubble_size=spline(lgR,dNdlnR);








