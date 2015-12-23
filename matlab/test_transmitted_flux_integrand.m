%%%% this shows the flux integrand for different lines

%%%setup_spline_P_delta;

z=6.15;
gamma=0.04;

delta=logspace(-1.3,2.);
delta_exp=2.; %%% isothermal gas

norm1=transmitted_flux_gamma2(gamma,z,1,delta_exp);
norm2=transmitted_flux_gamma2(gamma,z,2,delta_exp);
norm3=transmitted_flux_gamma2(gamma,z,3,delta_exp);

alpha1=transmitted_flux_integrand(delta,gamma,z,1,delta_exp)./norm1;
beta1=transmitted_flux_integrand(delta,gamma,z,2,delta_exp)./norm2;
gamma1=transmitted_flux_integrand(delta,gamma,z,3,delta_exp)./norm3;

%delta_exp=1.;

%alpha2=transmitted_flux_integrand(delta,gamma,z,1,delta_exp);
%beta2=transmitted_flux_integrand(delta,gamma,z,2,delta_exp);
%gamma2=transmitted_flux_integrand(delta,gamma,z,3,delta_exp);

xHIa=average_xHI_integrand(delta,gamma,z,1)./ ...
     average_neutral_fraction(gamma,z,1);
xHIb=average_xHI_integrand(delta,gamma,z,2)./ ...
     average_neutral_fraction(gamma,z,2); 


figure(1)
semilogx(delta,alpha1,'red',delta,beta1,'blue',delta,gamma1,'green',delta,xHIa,delta,xHIb)
%%%axis([-inf inf 1.e-7 1.e0])
%%%%axis([-inf 1.e3 -inf inf])

figure(2)
semilogx(delta,xHIa,delta,xHIb)
shg

matrix=[delta' alpha1' beta1' gamma1' xHIa' xHIb'];
save delta_integrand.dat matrix -ascii




%figure(2)
%semilogx(delta,alpha2,'red',delta,beta2,'blue',delta,gamma2,'green')
%axis([-inf inf 1.e-7 1.e0])



