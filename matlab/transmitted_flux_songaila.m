%%%% This gives the transmitted flux from the steepest descent integral
%in equation 17 of Songaila & Cowie 2002, ApJ, 123, 2183
%%% Note that a higher order line is somewhat equivalent to a higher
%order ionization rate
%%% This is accurate to within 8% within the z=4-6 redshift range of interest

function y=transmitted_flux_songaila(gamma,z,nline)
cosmological_parameters
  
if nline==1
  suppress_factor=1.;
end

if nline==2  %%% Lyman beta
  suppress_factor=6.241;
%%%%   suppress_factor=5.27;
end

if nline==3 %%% Lyman gamma
  suppress_factor=17.83;
end  


g=gamma*3.4146*suppress_factor;

%g=((Omega_m/0.35)^(0.5)).*((Omega_b*h*h/0.0325).^(-2)).*(h/0.65).*(2.^0.75).*gamma.*suppress_factor

zfactor=(1+z)/7;

y=4.5.*(g.^(-0.28)).*(zfactor.^2.2).*exp(-5.56*(g.^(-0.4)).*(zfactor.^3));
