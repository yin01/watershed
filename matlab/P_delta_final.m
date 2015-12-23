%%%% This gives P_delta as a function of z using spline fits

function y=P_delta_final(delta,z);

A=A_spline(z);
C_o=C_o_spline(z);
beta=beta_spline(z);
delta_o=delta_spline(z);

factor=A.*(delta.^(-beta));
exponent=(((delta.^-0.66667)-C_o).^2)./(2.*((2.*delta_o./3.).^2));

y=factor.*exp(-exponent)./log(10.);
