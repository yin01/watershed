%% this simply initializes the cosmological parameters
cosmological_parameters

%%%% 2 Apr 2016 ---initilize to parameters in Lin et al. 2015

h=0.67;
Omega_m=0.31;
Omega_lambda=1-Omega_m;
Omega_k=0;
Omega_b=0.049;
sigma8=0.83;

%{
%cosmology of FZH04
h=0.7;
Omega_m = 0.3;
Omega_lambda = 0.7;
Omega_b = 0.046;
sigma8 = 0.9;
Omega_k=0;
n_pk = 1;
%}
%{
%Planck13 as seen in Paranjape 2014 
Omega_m=0.315;
h=0.673;
sigma8 = 0.829
Omega_b=0.048;
Omega_k=0;
Omega_lambda=1-Omega_m;
%}
gamma_CDM=Omega_m*h*exp(-(Omega_b+Omega_b/Omega_m*sqrt(2*h)));
rho_crit_cgs=1.878e-29*h*h;
rho_m_comoving=2.776e11*h*h*Omega_m;   % in units of M_solar Mpc^-3
n_pk = 0.96;
Tcmb = 2.725;
%% this initializes physical constants

M_solar=1.9889225e33;
m_p_const=1.672623110E-24;
k_b_const=1.38065812e-16;
G_const=6.6725985e-8;
sigma_T=6.65e-25;
h_P=6.63e-27;
c=2.9979e10;
m_e=9.1e-28;
echarge=4.8e-10;
kpc_to_cm=3.0856775807e21;
keV_to_erg=1.60217733e-9;

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

%%% initialize distance measures

initialize_d_M_spline;

%%% initialize other problem specific constants

entropy_eV_to_cgs=1.6e-12/(mu_const*m_p_const)^(1.6667);
gam_gas=5./3.;