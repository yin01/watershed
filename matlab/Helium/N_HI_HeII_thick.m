

%%% this is the HI column density at which a system becomes optically
%thick to HeII ionizing photons

%%% comes from equation (21) of Haardt & Madau


function y=N_HI_HeII_thick(gam_HI,gam_HeII)

%% case A recombination coefficients, assuming T=1.e4
alpha_HI=2.51e-13;
alpha_HeII=1.36e-12;
alpha_B_HeII=9.08e-13;
    
eta_thin=0.08.*gam_HI./gam_HeII.*alpha_HeII./alpha_HI;

  
y=4.*1.6e17./eta_thin;