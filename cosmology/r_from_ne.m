% radius (in kpc h^-1) at which density is n (in cm^-3)

function y=r_from_ne(n,M)
cosmological_parameters
global n_frne M_frne

n_frne=n;
M_frne=M;


r200=r200_func(M);
lower=log(1.e-4*r200);
upper=log(r200);

limits=[lower upper];

y=fzero(@r_fr_ne_zero,limits);

y=exp(y);
  
  
  
function y=r_fr_ne_zero(lgr)
cosmological_parameters
global n_frne M_frne

r=exp(lgr);
rho_DM_cgs=rho_NFW(r,M_frne)*(2.e33*h*h)/((3.e21)^3);
ne=(Omega_b/Omega_m)*rho_DM_cgs/1.67e-24;
y=1-ne/n_frne;
