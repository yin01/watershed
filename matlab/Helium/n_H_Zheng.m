%% this is hydrogen abundance, NOT the neutral hydrogen column density 

%% n is in cm-3, and r is in kpc

function y=n_H_Zheng(r)
 
%%% first compute density
  
M_vir=1.e10;  % in M_solar
r_vir=11.1; % in kpc

A=0.05.*M_vir./(4.*pi.*r_vir); %% f_gas is 5%

rho_g=A./(r.^2).*2.e33./((3.e21)^3);  %% convert to g cm^3

nH=0.76.*rho_g./1.67e-24;

y=nH;

