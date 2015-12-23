%%%% This plots how the effective optical depth changes as a function of
%gamma


delta_e=2.;

gamma=logspace(-2,0.5,20);
z=6.15.*ones(size(gamma));
%%tau1=log(transmitted_flux_gamma2(gamma,z,1,delta_e));
%%%tau2=log(transmitted_flux_gamma2(gamma,z,2,delta_e));

lggam=log(gamma);

dtaudlggamma1=gradient(tau1)./gradient(lggam);
dtaudlggamma2=gradient(tau2)./gradient(lggam);


figure(1)
semilogx(gamma,tau1,gamma,tau2)
%%semilogx(gamma,dtaudlggamma1,gamma,dtaudlggamma2)
%%shg

%figure(2)
%plot(gamma,tau1,gamma,tau2)
%shg
