
%%% given N_HI, this calculates the various column densities

function [N_H N_HeI N_HeII N_HeIII]=N_all_from_N_HI(N_HI,gam_HI,gam_HeII)

N_HI_SS=1.6e17;  %%% self-shielding column density 
  
ne=6.e-4.*((N_HI./1.e16).^(0.6667)).*((gam_HI./1.e-12).^0.66667);

alpha_HI=2.51e-13; %%% case A recombination coefficient for hydrogen, for
                   %T=1.e4
alpha_HeII=1.36e-12;
		   
		   
x_HI=alpha_HI.*ne./gam_HI;

N_H=zeros(size(N_HI));
N_HeI=zeros(size(N_HI));
N_HeII=zeros(size(N_HI));

N_H(N_HI<N_HI_SS)=N_HI(N_HI<N_HI_SS)./x_HI(N_HI<N_HI_SS);

if (max(N_HI) >N_HI_SS)
  ne_LLS=6.e-4.*((N_HI_SS./1.e16).^(0.6667)).*((gam_HI./1.e-12).^0.66667);
  x_HI_LLS=alpha_HI.*ne_LLS./gam_HI;
  N_H_LLS=N_HI_SS./x_HI_LLS;
  x_HI_shielded=1.;
  
  N_H(N_HI>N_HI_SS)=N_H_LLS + ((N_HI(N_HI>N_HI_SS)-N_HI_SS)./x_HI_shielded);
  
end

N_He_tot=0.08.*N_H;
eta=eta_fardal(N_HI,gam_HI,gam_HeII);

N_HeII=eta.*N_HI;

%% first correct: about N_HI_LLS, the scaling relations are inaccurate

eta_thin=0.08.*gam_HI./gam_HeII.*alpha_HeII./alpha_HI;
N_HI_HeII_SS=4.*1.6e17./eta_thin;

%%%N_He_block=max(N_HeII,0.5.*N_He_tot);

%%%N_He_block=0.5.*N_He_tot;

%%x_HeIII=1.-(alpha_HeII.*ne)./(gam_HeII.*exp(-1.6e-18.*N_He_block)+ ...
%%			      alpha_HeII.*ne);

x_HeIII=exp(-(N_HI./N_HI_HeII_SS));

N_HeIII=x_HeIII.*N_He_tot;

if (max(N_HI)> N_HI_SS)
  eta_LLS=eta_fardal(N_HI_SS,gam_HI,gam_HeII);
  N_HeII_LLS=eta_LLS.*N_HI_SS;
  N_HeII(N_HI>N_HI_SS)=N_HeII_LLS;
end

%% HeII column density cannot exceed total column density 
N_HeII(N_HeII > N_He_tot)=N_He_tot(N_HeII> N_He_tot) - eps;

N_HeI=N_He_tot.*(1-x_HeIII)-N_HeII;









