
%% this is the power law fit from equation (5) of Fan et al (2006)

function y=tau_a_power(z)
  
 y=0.85.*(((1+z)./5).^4.3);