%%%% there is something very weird about least squares curve fitting,
%% try to fix this...

x=linspace(0,1);

true_coeff=[1., 2., 3.];

y=quadratic_poly(true_coeff,x);

coeff_guess=[0.5, 0.5, 0.5];

[derived_coeff,resnorm]=lsqcurvefit(@quadratic_poly,coeff_guess,x, ...
				    y);

