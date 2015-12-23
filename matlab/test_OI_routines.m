%%% Here are a bunch of the routines needed for the OI paper

%%% initialization routines

%%initialize_cosmology;
%%setup_spline_P_delta;


%%% volume weighted neutral fraction

xHI=3.e-4;
z=6.2;

massvol=0; %%%  0=vol-weighted 
	   %%%%%%1=mass-weighted

gam_beta=1; %%% index for radiation field models 

%%% Delta crit (models A &B) A==voids first, B=overdensities first

%Delta_critA=delta_fupdn(xHI,z,massvol,1)
%Delta_critB=delta_fupdn(xHI,z,massvol,0)

%%% Gamma (model C)

gam=gamma_from_xHI(xHI,z,massvol,gam_beta)

%%% tau_eff

delta_e=2.-gam_beta; %%% altered by 

tau_eff_C=abs(log(transmitted_flux_gamma2(gam*1.e12,z,1,delta_e)))

%%%% generate number of lines for models A & B, and f(N) for model C

%%%fN=fN_Schaye_full(NHI,z,gam,T,gam_beta)