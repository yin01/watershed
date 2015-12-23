
%%% this calculates the absorption probability 
%% as a function of HI column density just like in Haardt and Madau
%(1999)

N_HI=logspace(15.,20.,40);
z=3.;

Gamma_HI=1.e-12;
Gamma_HeII=1.e-14;

[N_H N_HeI N_HeII]=N_all_from_N_HI(N_HI,Gamma_HI,Gamma_HeIIa);

E1=55.;
E2=100.;
E3=200.;
E4=400.;

tau1=sigma_HI(E1).*N_HI + +sigma_HeI(E1).*N_HeI + sigma_HeII(E1).*N_HeII;
tau2=sigma_HI(E2).*N_HI + +sigma_HeI(E2).*N_HeI + sigma_HeII(E2).*N_HeII;
tau3=sigma_HI(E3).*N_HI + +sigma_HeI(E3).*N_HeI + sigma_HeII(E3).*N_HeII;
tau4=sigma_HI(E4).*N_HI + +sigma_HeI(E4).*N_HeI + sigma_HeII(E4).*N_HeII;


p_a1=1-exp(-tau1);
p_a2=1.-exp(-tau2);
p_a3=1-exp(-tau3);
p_a4=1.-exp(-tau4);

%[N_H N_HeI N_HeII]=N_all_from_N_HI(N_HI,Gamma_HI,Gamma_HeIIa);
%[N_Hb N_HeIb N_HeIIb]=N_all_from_N_HI(N_HI,Gamma_HI,Gamma_HeIIb);

%tau3=sigma_HI(E1).*N_HI + +sigma_HeI(E1).*N_HeI + sigma_HeII(E1).*N_HeII;
%tau4=sigma_HI(E1).*N_HI + +sigma_HeI(E1).*N_HeIb + sigma_HeII(E1).*N_HeIIb;

%p_a3=1.-exp(-tau3);
%p_a4=1.-exp(-tau4);


figure(3)
%%semilogx(N_HI,p_a1,'blue',N_HI,p_a2,'red',N_HI,p_a3,'green',N_HI,p_a4,'green')
semilogx(N_HI,p_a1,'blue',N_HI,p_a2,'red',N_HI,p_a3,'green',N_HI,p_a4,'cyan')
ylim([0. 1.2])
shg

