
function y=rcool(E,z,delta)
global E2 z2 delta2

E2=E;
z2=z;
delta2=delta;

lgr_guess=log(5.*3.e24);

y=exp(fzero(@rcool_func,lgr_guess));
  
function y=rcool_func(lgr)
cosmological_parameters 
global E2 z2 delta2
  
r=exp(lgr);

T=T_shock(E2,z2,delta2,r);

rho=rho_crit_cgs*Omega_b*((1+z2)^3)*delta2;
rho_shock=4.*rho;
n_shock=rho_shock/(mu_const*m_p_const);

tcool=1.5*k_b_const*T/(n_shock*1.e-22);
texpand=2./5.*r/v_shock(E2,z2,delta2,r);

y=1.-tcool/texpand;