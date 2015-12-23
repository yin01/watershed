%%%%% This finds that variance in the transmission as a function of the
%wavelength stretch

%%%% L is in Mpc h^-1 (COMOVING)

function y=sigma_transmission(L,z)
global Lg_sigma zg_sigma

%%% initialize global variables
Lg_sigma=L;
zg_sigma=z;

lower=log(1./100);
upper=log(30.);

sigmasq=2./(2.*pi).*quadl(@sigma_t_int,lower,upper);
y=sqrt(sigmasq);


function y=sigma_t_int(lgk)
global Lg_sigma zg_sigma  
  
k=exp(lgk);

x=k.*Lg_sigma./2;

factor=((sin(x)./x).^2);


y=factor.*k.*Pflux(k).*(growth_factor(zg_sigma).^2);