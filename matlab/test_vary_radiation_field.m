%%% This tests the effect of a fluctuating radiation field on tau_eff

global xbar_global lgsigma_global

lower=log(1.e-6);
upper=log(1.e3);

xbar_global=0.05;
lgsigma_global=0.1;

norm=quadl(@lognormal_int,lower,upper)

%%% this bit tests the double integration

gamma_bar=0.02;
sig_lggamma=1.;
z=6.15;
nline1=1;
nline2=2;
nline3=3;
delta_e=3;


%t1=transmitted_flux_gamma2(gamma_bar,z,nline1,delta_e)

uniform=1;  %%% don't want to do the uniform thing

if uniform==1 

flux=exp(-6.99);
gamma=gamma_from_flux2(flux,z,1,delta_e)
t1=log(transmitted_flux_gamma2(gamma,z,1,delta_e))
t2=log(transmitted_flux_gamma2(gamma,z,2,delta_e))
t3=log(transmitted_flux_gamma2(gamma,z,3,delta_e))

ratio1=t1/t2
ratio2=t1/t3

else

t1=log(transmitted_flux_gamma_vary(gamma_bar,sig_lggamma,z,nline1, ...
				      delta_e))
t2=log(transmitted_flux_gamma_vary(gamma_bar,sig_lggamma,z,nline2, ...
				      delta_e))
t3=log(transmitted_flux_gamma_vary(gamma_bar,sig_lggamma,z,nline3, ...
				      delta_e))

ratio1=t1/t2
ratio2=t1/t3

end

stop


test1=log(transmitted_flux_gamma2(gamma_bar,z,nline1,delta_e))./ ...
      log(transmitted_flux_gamma2(gamma_bar,z,nline3,delta_e)) 

%test2=log(transmitted_flux_gamma_vary(gamma_bar,sig_lggamma,z,nline1, ...
%				      delta_e))./log(transmitted_flux_gamma_vary(gamma_bar,sig_lggamma,z,nline3,delta_e)) 
%ratio=test1/test2



