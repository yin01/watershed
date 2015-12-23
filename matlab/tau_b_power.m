
%% this is the power law fit from equation (5) of Fan et al (2006)

function y=tau_b_power(z)
  
 y=0.38.*(((1+z)./5).^4.3);