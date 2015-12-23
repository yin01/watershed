function y=P_delta_full(delta,z,A,delta_o,C_o);

beta=beta_spline(z);

factor=A.*(delta.^(-beta));
exponent=(((delta.^-0.66667)-C_o).^2)./(2.*((2.*delta_o./3.).^2));

y=factor.*exp(-exponent)./log(10.);

  
  
  