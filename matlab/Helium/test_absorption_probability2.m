
%%% this calculates the absorption probability 
%% as a function of HI column density just like in Haardt and Madau
%(1999)

N_HI=logspace(15.,20.,40);
z=3.;

Gamma_HI=1.e-12;
Gamma_HeIIa=1.e-14;
Gamma_HeIIb=1.e-15;

eta1=eta_fardal(N_HI,Gamma_HI,Gamma_HeIIa);
eta2=eta_fardal(N_HI,Gamma_HI,Gamma_HeIIb);

eta_thin=1./12.*Gamma_HI./Gamma_HeIIa;


N_HeIIa=N_HI.*eta1;
N_HeIIb=N_HI.*eta_thin;

E1=55.;
E2=100.;
E3=200.;
E4=400.;


%tau1=sigma_HI(E1).*N_HI + sigma_HeII(E1).*N_HeIIa;
%tau2=sigma_HI(E1).*N_HI + sigma_HeII(E1).*N_HeIIb;

tau1=sigma_HeII(E1).*N_HeIIa;
tau2=sigma_HeII(E2).*N_HeIIa;
tau3=sigma_HeII(E3).*N_HeIIa;
tau4=sigma_HeII(E4).*N_HeIIa;

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

