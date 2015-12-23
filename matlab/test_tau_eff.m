%%% This tests the effective tau thing

%%% initialization_functions

initialize_cosmology;
%%%setup_spline_P_delta;

%%% test fN

NHI=logspace(18.,19.,10);

z=6.2;
gam=0.01;
T=1.5e4;
gam_beta=0.;

fN=fN_Schaye_full(NHI,z,gam,T,gam_beta);

R=10.;
gam=0.001;

tau_eff=tau_eff_R_gamma(R,gam,z)