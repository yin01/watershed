

f=linspace(0.1,3,10);

tau_min=0.1;
tau_max=100.;
tau_trans=2.5;

boost=(mfp_jordi2(1,tau_min,tau_trans)+mfp_jordi2(f,tau_trans,tau_max))./mfp_jordi2(1.,tau_min,tau_max);

boost=1./boost;

figure(3)
plot(f,boost);
shg


tau_max=logspace(-0.9,2);

tau_min=0.1;

frac=mfp_jordi3(1.,tau_min,tau_max)./mfp_jordi3(1.,tau_min,100.);

figure(4)
semilogx(tau_max,frac)
shg

