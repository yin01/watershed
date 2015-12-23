
%% this calculates the PHYSICAL mean free path of a Helium ionizing photon
%%% E (in eV) is allowed to be a variety of energies


function y=mfp_He_ionizing_photon(E,Q,Delta_i,z)
global E_g_mfp z_g_mfp Q_mfp delta_mfp
  
nE=length(E);
y=zeros(size(E));

z_g_mfp=z;
Q_mfp=Q;
delta_mfp=delta_i;

for i=1:nE
  E_g_mfp=E(i);
  y(i)=exp(fzero(@mfp_He_int,[log(0.05) log(100)]));  
end


function y=mfp_He_int(lglambda)
global E_g_mfp z_g_mfp Q_mfp delta_mfp

lambda=exp(lglambda);
  
y=P_absorb_He(E_g_mfp,lambda,Q_mfp,delta_mfp,z_g_mfp)-0.90;
