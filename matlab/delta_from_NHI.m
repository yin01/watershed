%%% This gives delta as a function of NHI
%%% from equation (10) of Schaye 2001
%%% Note that 1+delta (Schaye's definition) = Delta (our definition)

function y=delta_from_NHI(NHI,T,gam,z)
  
NHI_factor=(NHI./2.7e13);

Tfactor=T./1.e4;
zfactor=(1+z)./4;

y=(NHI_factor.^(0.66667)).*(Tfactor.^(0.26*0.66667)).* ...
      (gam.^0.66667).*(zfactor.^(-4.5*0.66667));

