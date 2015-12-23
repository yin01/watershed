%%%% This computes the fN distribution by taking the first derivative of
%Schaye 2001, equation (16)

function y=fN_Schaye(NHI,z,gam,T)
cosmological_parameters
  
RHS=2.2e-9/h.*(gam.^0.3333).*((T./1.e4).^0.59).*(NHI.^0.33333);
delta=delta_from_NHI(NHI,T,gam,z);

%%% calculate derivative 
NHI_factor=(NHI./2.7e13);
Tfactor=T./1.e4;
zfactor=(1+z)./4;
ddelta_dNHI=0.6666667.*(NHI_factor.^(-0.33333)).*(Tfactor.^(0.26*0.66667)).* ...
      (gam.^0.66667).*(zfactor.^(-4.5*0.66667))./2.7e13;

%%% put it all together
LHS=Omega_b.*delta.*P_delta_final(delta,z).*ddelta_dNHI;
y=LHS./RHS;



