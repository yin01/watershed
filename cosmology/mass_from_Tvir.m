%% This gives the halo mass from the virial temperature
%% mass is in M_solar (NOT M_solar h^-1)

%%% 12 March 2005. This was changed so to correspond to the plots in FHZ
%%


function y=mass_from_Tvir(T,z) 
  
zfactor=((1+z)./10).^(-1.5);
Tfactor=(T./1.e4).^(1.5);



%%%y=9.4198e7.*zfactor.*Tfactor;  %%% for fully ionized gas

%%%y=((0.6/1.22)^1.5)*9.4198e7.*zfactor.*Tfactor;  %% for neutral gas

%%%y=8.56e7.*zfactor.*Tfactor;

y=4.5e7.*zfactor.*Tfactor;