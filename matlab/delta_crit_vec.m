
%%% this gives the median value of the overdensity where 50% of the flux
%comes from,  as well as the 68% confidence intervals 

function [med_delta lower_delta upper_delta]=delta_crit_vec(tau,z,gam, ...
						  nline,delta_e)

  
med_delta=delta_crit_from_frac(tau,z,gam,nline,delta_e,0.5);
display('got past med_delta')

lower_confidence=0.16; 
upper_confidence=0.84;

lower_delta=delta_crit_from_frac(tau,z,gam,nline,delta_e,lower_confidence);
upper_delta=delta_crit_from_frac(tau,z,gam,nline,delta_e, ...
				 upper_confidence);



