%%% this gives sigmaM by integrating the power spectrum
%%% Note that all M's are given in M_solar, NOT M_solar h^-1


function y=sigmaM_full(M)
cosmological_parameters
global r_M_comoving_global

nmass=length(M);
y=zeros(size(M));

for i=1:nmass
  
rho=rho_m_comoving / (h*h*h);  %%% this has units of M_solar Mpc^-3 h^3
r_M_comoving_global=(3.*M(i)/4./pi/rho).^0.3333333; %%% this has units of
                                                   %Mpc h^-1

lower=log(1.e-5);
upper=log(1.e8);

integ=integral(@sigmaM_full_func,lower,upper);

y(i)=sqrt(integ./((2.*pi).^3));

end

function y=sigmaM_full_func(lgk)
global r_M_comoving_global

k=exp(lgk);
x=r_M_comoving_global.*k;   %since r_M_comoving_global has units of Mpc h^-1
                            %k is in unit of h Mpc^-1
window2=((3./(x.^3)).*(sin(x)-x.*cos(x))).^2;  %top hat model
y=window2.*pk(k).*4.*pi.*k.*k.*k; 