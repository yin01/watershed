
%% this gives the analytic solution to dtau_ddz

function y=dtau_dz_HI_analytic(z1,z2,E)

beta=1.5;
N_o=1./sigma_HI(13.6);
N_min=1.e14;

Eprime=E./(1+z1).*(1+z2);
x=Eprime./13.6;

dNdz_bit=3.3.*(((1+z2)./5.).^1.5);

%%y=dNdz_bit.*(N_o./N_min).^(beta-1);

y=dNdz_bit.*sqrt(pi).*(x.^(-2.9.*(beta-1)));

