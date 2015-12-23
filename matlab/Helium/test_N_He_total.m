

%%% this calculates the total N_He as a function of N_HI

N_HI=logspace(13.,20.,30);
z=3.;

Gamma_HI=1.e-12;
Gamma_HeIIa=1.e-14;
Gamma_HeIIb=1.e-15;

eta1=eta_fardal(N_HI,Gamma_HI,Gamma_HeIIa);
eta2=eta_fardal(N_HI,Gamma_HI,Gamma_HeIIb);

alpha1=gradient(log(eta1),log(N_HI));
alpha2=gradient(log(eta2),log(N_HI));

N_HeIIa=N_HI.*eta1;
N_HeIIb=N_HI.*eta2;

figure(1)
loglog(N_HI,eta1,N_HI,eta2)
%%ylim([0.01 1000.]);

shg

figure(2)
loglog(N_HI,N_HeIIa,N_HI,N_HeIIb)
shg

figure(3)
semilogx(N_HI,alpha1,N_HI,alpha2)
shg