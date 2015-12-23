%%% This gives NHI as a function of delta
%%% from equation (10) of Schaye 2001
%%% Note that 1+delta (Schaye's definition) = Delta (our definition)


function y=NHI_from_delta(delta,T,gam,z)
  
Tfactor=T./1.e4;
zfactor=(1+z)./4;  

y=2.7e13.*(delta.^1.5).*(Tfactor.^(-0.26))./gam.*(zfactor.^(4.5));
