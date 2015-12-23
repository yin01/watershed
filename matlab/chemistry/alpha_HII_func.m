
%%% case A recombination rate as a function of temperature for hydrogen
%%% units are cm^3 s^-1

function y=alpha_HII_func(T)
  
lambda_HI=2.*157807./T;
y=1.269e-13.*(lambda_HI.^1.503)./((1+(lambda_HI./0.522).^0.470).^1.923);