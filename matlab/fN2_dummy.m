%%%% This is the dummy approximation the the Schaye thing
%%% assuming ionization equilibrium

function y=fN2_dummy(NHI,z,gam,T)
cosmological_parameters


delta=delta_from_NHI(NHI,T,gam,z);
NHI_factor=(NHI./2.7e13);
Tfactor=T./1.e4;
zfactor=(1+z)./4;

y=9.62e-3*(delta.*P_delta_final(delta,z)).*((zfactor.^(-3))).* ...
  (gam.^0.3333).*(Tfactor.^(-0.42)).*(NHI.^(-0.66667));
