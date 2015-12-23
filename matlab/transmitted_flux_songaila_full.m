%%% this includes the dependence on the equation of state
%%% via tau \propto delta^delta_exp

%%% this is only valid from z=4-6ish

%%%% This gives the transmitted flux from the steepest descent integral
%in equation 17 of Songaila & Cowie 2002, ApJ, 123, 2183
%%% Note that a higher order line is somewhat equivalent to a higher
%order ionization rate
%%% This is accurate to within 8% within the z=4-6 redshift range of interest

function y=transmitted_flux_songaila_full(gamma,delta_exp,z,nline)
  
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


g=gamma*3.4146*suppress_factor

delta_o=7.61./(1+z);
tau_u=14./g.*(((1+z)./7.).^4.5);

bigD_o=(3./(2.*tau_u.*delta_exp.*delta_o.*delta_o)).^(1./(delta_exp+4./3.));

fac2=sqrt(4.*pi./(3.*delta_exp+4.));
fac3=delta_o.*(bigD_o.^(5./3.-beta_spline(z)));
fac4=-((3./2./delta_exp)+9./8.).*(bigD_o.^(-4./3.)).*(delta_o.^(-2))

%%zfactor=(1+z)/7;

%%y=4.5.*(g.^(-0.28)).*(zfactor.^2.2).*exp(-4.4.*(g.^(-0.4)).*(zfactor.^3));

y=A_spline(z).*fac2.*fac3.*exp(fac4);