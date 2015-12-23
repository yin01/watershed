%%% This gives the Helium fN from the fardal function
%% input is N_HI, z

function y=fN_HeII_fardal(N_HI,Gamma_HI,Gamma_HeII,z)

y=eta_fardal(N_HI,Gamma_HI,Gamma_HeII).*N_HI;