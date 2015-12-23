


%% this computes the probability that something is absorbed by LLS 
%%% for a given size of HII region r_ion
%% and IGM ionization fraction Q

%%% this works for a vector in E

%%% tau_fixed is the tau you want to set things to...set it either to %%
%1 or 2
%% also, this assumes that 

function [r,P_abs]=P_abs_LLS(E_vec,r_ion,Q,z,tau_fixed)

nE=length(E_vec);  
P_abs=zeros(size(E_vec));
r=zeros(size(E_vec));
  
%%% first check if it's all absorbed by LLSs

for i=1:nE
  
  E=E_vec(i);
  tau_ionized=tau_eff_He_LLS(r_ion,E,z);

  if tau_ionized>=tau_fixed
    P_abs(i)=1.;
    r(i)=tau_fixed./tau_ionized;
  else

%%% otherwise, have to determine what r is

tau_makeup=tau_fixed-tau_ionized;

r(i)=tau_makeup./tau_tot(E,1.,0.,Q,z)+r_ion;

%% and here's P_abs

P_abs(i)=(1.-exp(-tau_eff_He_LLS(r(i),E,z)))./(1-exp(-tau_fixed));

  end
  
end