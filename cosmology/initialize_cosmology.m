%% this simply initializes the cosmological parameters
cosmological_parameters

%%%% 24 Nov 2008 ---initilize to WMAP 5 year cosmology unless otherwise
%indicated
initialize_WMAP_5year_cosmology;
return

Omega_m=0.28;
Omega_lambda=0.72;
Omega_k=1.-Omega_m-Omega_lambda;
h=0.7;
Omega_b=0.046;
sigma8=0.9;
gamma_CDM=Omega_m*h*exp(-(Omega_b+Omega_b/Omega_m*sqrt(2*h)));
rho_crit_cgs=1.987e-29*h*h;
%rho_m_comoving=2.684e11*h*h*Omega_m;   % in units of M_solar Mpc^-3
rho_m_comoving = 2.9196e11*h*h*Omega_m;  % in units of M_solar Mpc^-3
%% this initializes physical constants

m_p_const=1.67e-24;
k_b_const=1.38065812e-16;
G_const=6.6725985e-8;
sigma_T=6.65e-25;
h_P=6.63e-27;
c=2.9979e10;
m_e=9.1e-28;
echarge=4.8e-10;
kpc_to_cm=3.0856775807e21;


%%% this mu_const for ionized gas

mu_const=0.62;

%%% initialize norm for sigma_M


Mass=4./3.*pi*rho_m_comoving*((8/h)^3);  %%% mass is in units of M_solar

p=0.0873;
m=Mass*((gamma_CDM*h)^2)/(1.e12);

sm=(1.+2.208*(m^p)-0.7668*(m^(2.*p))+0.7949*(m^(3.*p))).^(-2./(9.*p));

sigma_norm=sigma8/sm;

%%% initialize power_spectrum

initialize_power_spectrum;

%%% initialize other problem specific constants

entropy_eV_to_cgs=1.6e-12/(mu_const*m_p_const)^(1.6667);
gam_gas=5./3.;