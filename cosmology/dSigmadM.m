%%% Input M in Msolar 

%%% This has units of 1/(M_solar)

function y=dSigmadM(Mass)
cosmological_parameters

p=0.0873;
m=Mass*((gamma_CDM*h).^2)./1.e12;

sig=1.+2.208.*(m.^p)-0.7668.*(m.^(2.*p))+0.7949.*(m.^(3.*p));
sig=(-2./(9.*p)).*(sig.^(-(2./(9.*p))-1.));
 
dsig=p.*2.208*(m.^(p-1.))-2.*p*0.7668*(m.^(2.*p-1.))+3.*p.*0.7949.* ...
     (m.^(3.*p-1.));

      
%%%%y=sigma_norm.*sig.*dsig*((Omega_m.*h.*h).^2)/(1.e12); 

dmdMass=((gamma_CDM*h).^2)./1.e12;

y=sigma_norm.*sig.*dsig*dmdMass;  