%%% This tests the proximity zone in which the galaxy radiation is
%comparable to the ionizing background

z=4.9;

ratio_fluxes=4.6*((900/1450)^2);  %%% ratio of f_lambda(1500)/f_lambda(900)
flux=3.9e-20;

L_dimensionless=1450*(1+z)*flux/ratio_fluxes*4*pi*((d_L(z)*3.e24)^2);

nu=13.6*1.6e-12/6.63e-27;
L_nu=f_dimensionless/nu

gamma=0.15;
J_nu=1.5*gamma*1.e-21;  %% this is for a starburst spectrum 
r=sqrt(L_nu/J_nu)/4./pi*(1+z)/3.e24