%%% here is a fit to the mean flux transmission as a function of redshift

function y=mean_flux_fit(z)
  
y=0.031.*(((1+z)./7.).^(-8.1));