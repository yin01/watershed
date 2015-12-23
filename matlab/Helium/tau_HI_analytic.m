
%%% this is the analytic approximation to tau_HI

function y=tau_HI_analytic(z1,z2,E)
global z1_g E_g

z1_g=z1;
E_g=E;

y=tau_HI_analytic_func(z2)-tau_HI_analytic_func(z1);

y=abs(y);

function y=tau_HI_analytic_func(z)
global E_g z1_g

beta=1.5;
gam=1.5;

y=dtau_dz_HI_analytic(z1_g,z,E_g).*(1+z)./(gam-(beta-1).*2.9+1);
