
%%% this computes the mean energy per HeII photoionization
%%% given an array of energies and mfp for that energy
%%% alpha is the power law index of the quasar spectrum 

function [Emean k]=E_mean_He(E,mfp,alpha)
global E_g mfp_g alpha_g

E_g=E;
mfp_g=mfp;
alpha_g=alpha;

top=quadl(@E_mean_func1,log(54.41),log(max(E)));
bot=quadl(@E_mean_func2,log(54.41),log(max(E)));

Emean=top./bot;

k=54.4./Emean-alpha;

function y=E_mean_func1(lgE)
global E_g mfp_g alpha_g
  
E=exp(lgE);

fac1=E.*(E-54.4).*(E.^(-alpha_g)).*sigma_HeII(E);

fac2=exp(spline(log(E_g),log(mfp_g),lgE));

y=fac1.*fac2;


function y=E_mean_func2(lgE)
global E_g mfp_g alpha_g
  
E=exp(lgE);

y=E.*(E.^(-alpha_g)).*exp(spline(log(E_g),log(mfp_g),lgE)).* ...
  sigma_HeII(E);

