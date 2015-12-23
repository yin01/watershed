
%%% this is a script to compute the mean free path as a function of
%energy using the fardall prescription for computing eta

%% first reproduce the eta plot in Fig A1 of McQuin et al 2008

N_HI=logspace(13.,20.,30);
z=3.;

Gamma_HI=1.e-12;
Gamma_HeIIa=1.e-14;
Gamma_HeIIb=1.e-15;

eta1=eta_fardal(N_HI,Gamma_HI,Gamma_HeIIa);
eta2=eta_fardal(N_HI,Gamma_HI,Gamma_HeIIb);

N_HeIIa=N_HI.*eta1;
N_HeIIb=N_HI.*eta2;

figure(1)
loglog(N_HI,eta1,N_HI,eta2)
ylim([0.01 1000.]);
shg

%%% now compute power law of fardal

eta1_power=N_HI./eta1.*gradient(eta1,N_HI);
eta2_power=N_HI./eta2.*gradient(eta2,N_HI);


figure(10)
semilogx(N_HI,eta1_power,N_HI,eta2_power)
shg


%%% then test the HI power law distribution 

N_HI2=logspace(12.,20.,300);
fN_HI=fN_fardal(N_HI2,z);
eta1=eta_fardal(N_HI2,Gamma_HI,Gamma_HeIIa);
eta2=eta_fardal(N_HI2,Gamma_HI,Gamma_HeIIb);

N_HeIIa=N_HI2.*eta1;
N_HeIIb=N_HI2.*eta2;

figure(2)
loglog(N_HI2,N_HI2.*fN_HI./(1+z))
ylim([0.01 100.])
shg

%% then compute fN_He using the eta prescription, and compare to the power
%% law prescription

fN_He1=fN_fardal(N_HI2,z)./eta1;
fN_He2=fN_fardal(N_HI2,z)./eta2;

figure(3)
%%%loglog(N_HeIIa,fN_He1,N_HeIIb,fN_He2)
loglog(N_HI2,fN_He1,N_HI2,fN_He2)


power_index1=diff(fN_He1)./diff(N_HeIIa).*N_HeIIa(1:end-1)./fN_He1(1:end- ...
						  1);
power_index2=diff(fN_He2)./diff(N_HeIIb).*N_HeIIb(1:end-1)./fN_He2(1:end- ...
						  1);

figure(4)
semilogx(N_HeIIa(1:end-1),power_index1,N_HeIIb(1:end-1),power_index2)
ylim([-3. 0.])
shg


