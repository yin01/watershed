%%% This is the relation between eta=N_HeII/N_HI and N_HI
%% from 
%%% given Gamma_HeII and Gamma_HI
%%% note: input N_HI is N_HI_obs, whereas solution to equation is for N_perp

function y=eta_fardal(N_HI,Gamma_HI,Gamma_HeII)
global N_HI_g Gam_HI_g Gam_HeII_g

%% initialize global variables


Gam_HI_g=Gamma_HI;
Gam_HeII_g=Gamma_HeII;

y=zeros(size(N_HI));

for i=1:length(N_HI)

N_HI_g=N_HI(i)./sqrt(3); %% factor of mu_1=1./sqrt(3) comes from
                         %conversion between N_perp= mu_1 N_obs  
y(i)=exp(fzero(@eta_fardal_func,0.,2.8));

%% this caps the value to be n_He/n_H
%%% actually all the Helium turns to HeI instead of HeII 
%% but it doesn't really matter since the cross-sections are roughly
%similar
%%% and there's not much contribution to the opacity here anyway
%%y(i)=max(y(i),0.08);

end

%%% 




