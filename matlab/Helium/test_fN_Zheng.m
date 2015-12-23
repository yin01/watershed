
global xHI_Zheng_splinefit_g

%%% this does a series of test to the Zheng distribution
%%% in particular, it shows that i can reproduce the HI column density distibrution, given the neutral fraction profiles 
%% to the isothermal sphere 

%% I think this is the 'true' fN_Zheng distribution obtained by GraphClick 
load -ascii fN_Zheng.dat

N_HI_true=fN_Zheng(:,1);
fN_true=fN_Zheng(:,2);

log_der=gradient(log(fN_true),log(N_HI_true));

figure(1)
loglog(N_HI_true,fN_true,'*')
shg

figure(2)
semilogx(N_HI_true,log_der,'*')
shg


%%% this is also obtained by GraphClick from the Zheng and Miralda-Escude paper 
load -ascii xHI_Zheng.dat

r=(xHI_Zheng(:,1));
xHI=(xHI_Zheng(:,2));

xHI_Zheng_splinefit_g=spline(log(r),log(xHI));

r2=logspace(-1.5,1.5);

x_HI_spline=xHI_Zheng_spline(r2);

figure(3)
loglog(r,xHI,'*',r2,x_HI_spline)
shg

nHI=n_HI_Zheng(r2);


figure(4)
loglog(r2,nHI)
shg

alpha=gradient(log(nHI),log(r2));

figure(5)
semilogx(r2,alpha)
shg

r3=logspace(-1.5,1.);

N_HI=NHI_column_Zheng(r3);

figure(6)
loglog(r3,N_HI)
shg

[N_HI fN_Zheng]=compute_fN_Zheng;

figure(7)
loglog(N_HI,fN_Zheng,N_HI_true,fN_true,'*')
shg