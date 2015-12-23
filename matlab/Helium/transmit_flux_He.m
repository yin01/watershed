
%%% this gives the transmitted flux for Helium

function y=transmit_flux_He(gam,z,delta_e)
global gamma_global zglobal delta_exp



delta_exp=delta_e;

nz=length(z);
y=zeros(size(z));

for i=1:nz
  gamma_global=gam(i);
  zglobal=z(i);
  
lower=log(1.e-2);
upper=log(1.e2);

y(i)=quadl(@transmitted_flux_He_func,lower,upper,1.e-8);

end


function y=transmitted_flux_He_func(lgdelta)
He_parameters
cosmological_parameters
global gamma_global zglobal delta_exp

delta=exp(lgdelta);

T=1.5e4;

x_i=3.8e-3.*delta.*((T/1.e4).^-0.7)*((gamma_global/1.e-14).^-1).*(((1+zglobal)./4.).^3);


nHe=n_He_comoving.*((1+zglobal).^3).*delta;
f=0.416;
lambda=303.7822e-8;

tau=f.*pi*(echarge.^2)./(m_e.*3.e10).*lambda.*x_i.*nHe.*t_H(zglobal).* ...
    3.e7;


y=P_delta_final(delta,zglobal).*delta.*exp(-tau);