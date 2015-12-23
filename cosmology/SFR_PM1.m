%% star formation rate model 1 from madau & pozzetti

function y=SFR_PM1(z) 
cosmological_parameters

y=0.3.*(h./0.65).*exp(3.4.*z)./(exp(3.8.*z)+45);

y=y.*SFR_correction(z);


