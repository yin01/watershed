

%%% Reproduce McQuinn plot in Fig 16 of their paper, and the do it for my
%paper

z=3.;

Gamma_HI=1.e-12;
Gamma_HeIIa=1.e-14;
Gamma_HeIIb=1.e-15;

N=logspace(13,18,20);

eta1=eta_fardal(N_HI,Gamma_HI,Gamma_HeIIa);
eta2=eta_fardal(N_HI,Gamma_HI,Gamma_HeIIb);

paper_plots=0;

if paper_plots==1

%%% FIGURE 1 ---eta plot 
figure(1)
loglog(N_HI,eta1,N_HI,eta2)
ylim([10. 1000.])
shg

E1=55;
E2=100;
E3=200;
E4=400;

mfp1=mfp_McQuinn(E1,N_HI,Gamma_HI,Gamma_HeIIb,z);
mfp2=mfp_McQuinn(E2,N_HI,Gamma_HI,Gamma_HeIIb,z);
mfp3=mfp_McQuinn(E3,N_HI,Gamma_HI,Gamma_HeIIb,z);
mfp4=mfp_McQuinn(E4,N_HI,Gamma_HI,Gamma_HeIIb,z);


%%% FIGURE 2 --- mean free path 
figure(2)
loglog(N_HI,mfp1,N_HI,mfp2,N_HI,mfp3,N_HI,mfp4)
ylim([10. 4000.])
shg

log_deriv1=abs(gradient(1./mfp1,log(N_HI)));
log_deriv2=abs(gradient(1./mfp2,log(N_HI)));
log_deriv3=abs(gradient(1./mfp3,log(N_HI)));
log_deriv4=abs(gradient(1./mfp4,log(N_HI)));

%%% FIGURE 3 --- log derivative
figure(3)
loglog(N_HI,log_deriv1,N_HI,log_deriv2,N_HI,log_deriv3,N_HI,log_deriv4)
ylim([1.e-4 6.e-2])
shg

end

E=logspace(log10(55),log10(500),20);

E_factor=(E./55.).^1.5;

mfp1=mfp_McQuinn(E,1.e12,Gamma_HI,Gamma_HeIIa,z);
mfp2=mfp_McQuinn(E,1.e12,Gamma_HI,Gamma_HeIIb,z);
mfp3=mfp_full(E,1.e12,Gamma_HI,Gamma_HeIIa,z);
mfp4=mfp_full(E,1.e12,Gamma_HI,Gamma_HeIIb,z);

mfp1a=mfp_McQuinn(55,1.e12,Gamma_HI,Gamma_HeIIa,z).*E_factor;
mfp2a=mfp_McQuinn(55,1.e12,Gamma_HI,Gamma_HeIIb,z).*E_factor;

%%% FIGURE 4 --- mean free path
figure(4)
loglog(E,mfp1,'red',E,mfp2,'blue',E,mfp3,'green',E,mfp4,'yellow')
xlim([50. 500.])
shg

power_law1=gradient(log(mfp1),log(E));
power_law2=gradient(log(mfp2),log(E));
power_law3=gradient(log(mfp3),log(E));
power_law4=gradient(log(mfp4),log(E));

%%% FIGURE 5 ---mean free path power law index
figure(5)
semilogx(E,power_law1,'red',E,power_law2,'blue',E,power_law3,'green',E,power_law4,'yellow')
xlim([50. 500.])
shg

