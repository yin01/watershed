%%% this is the Madau and Haardt fit to the emissivity
%% E is in eV
%%% note that spectral index is 1.57

function y=emissivity_hopkins(E,z)

exp_factor=exp(-0.28.*z)./(exp(1.77.*z)+26.3);
z_factor=(1+z).^4.68;
E_factor=(E./13.6).^(-1.57);

y=((1+z).^3).*4.e24.*z_factor.*exp_factor.*E_factor;

%%%y(E>54.4)=0.;  %% cut off emission above Helium Lyman edge
