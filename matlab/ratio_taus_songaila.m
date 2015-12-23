%%%% This is the ratio of taus for different line strengths in songaila
%model

function y=ratio_taus_songaila(gamma,z)
  
zfactor=(1+z)/7;  
A=2.69*(gamma.^(-0.4)).*(zfactor.^3);
B=log(3.19.*(zfactor.^2.2).*(gamma.^(-0.28)));

fbeta=6.241;
fgamma=17.83;


beta_factor=(A-B)./(A*(fbeta^(-0.4))-B+0.28.*log(fbeta));
gamma_factor=(A-B)./(A*(fgamma^(-0.4))-B+0.28.*log(fgamma));

y=[beta_factor gamma_factor];

%%%y=A-B;