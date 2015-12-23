%%%% This gives the mean flux from the LBQS fit from lambda_min to
%lambda_max

function y=LBQS_mean_flux(lambda_min,lambda_max)
global lambda_LBQS flux_LBQS
  
%%%%y=quadl(@spline_LBQS_flux,lambda_min,lambda_max)./(lambda_max- ...
%%						  lambda_min);

index_lambda=find((lambda_LBQS>lambda_min)&(lambda_LBQS<lambda_max));						  

y=mean(flux_LBQS(index_lambda));