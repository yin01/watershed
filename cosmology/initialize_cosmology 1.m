%% this simply initializes the cosmological parameters
cosmological_parameters

Omega_m=0.3;
Omega_lambda=0.7;
Omega_k=1.-Omega_m-Omega_lambda;
h=0.7;
Omega_b=0.019/h/h;
sigma8=0.9;
gamma_CDM=Omega_m*h*exp(-(Omega_b+Omega_b/Omega_m*sqrt(2*h)));
rho_crit_cgs=1.99e-29*h*h;

%% this initializes physical constants

m_p_const=1.67e-24;
k_b_const=1.38e-16;
G_const=6.67e-8;
sigma_T=6.65e-25;
h_P=6.63e-27;
c=2.99792e10;
m_e=9.1e-28;
echarge=4.8e-10;


%%% this mu_const for ionized gas

mu_const=0.62;

%%% initialize norm for sigma_M

rho=2.68e11/h*Omega_m;
Mass=4./3.*pi*rho*(8^3);

p=0.0873;
m=Mass*((gamma_CDM*h)^2)/(1.e12);

sm=(1.+2.208*(m^p)-0.7668*(m^(2.*p))+0.7949*(m^(3.*p))).^(-2./(9.*p));

sigma_norm=sigma8/sm;

%%% initialize other problem specific constants

entropy_eV_to_cgs=1.6e-12/(mu_const*m_p_const)^(1.6667);