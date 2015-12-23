
%%% Here is a (bad) fit to the transmission from Fig 10 of Zheng et al
%(2004). It's only valid for z < 2.8, above that there is a big jump

function y=tau_eff_He(z)

  
y=1.*((1+z)./3.8).^3.5;