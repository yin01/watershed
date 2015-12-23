
%%% this gives the probability distribution of transmitted fluxes

function y=P_F_lognormal(F,z)
%%%%global mu_g1 sigma_g1

sigma=sigma_z_becker(z);
mu=mu_z_becker(z);
  
lgF=log(F);

denom=(-lgF).*F.*sigma.*sqrt(2.*pi);

factor=-(log(-lgF)-mu).^2/(2.*(sigma.^2));

y=1./denom.*exp(factor);

