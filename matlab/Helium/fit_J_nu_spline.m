
%%% this constructs a grid on which J_nu_spline is fit

function [E_vec,J_vec]=fit_J_nu_spline(z)
 
m=5.;   %%% this gives bigI points between 1 and 4 Ry---for m=5, it's 25
R=(4./3.).^(1./m);

bigI=floor(log(4)*m/log(4/3) + 1);

small_i=linspace(1,bigI,bigI);


E_vec=54.4./(R.^(small_i-1));
J_vec=J_nu_calc(E_vec,z);

%%% now truncate it to reasonably large values

E_vec=E_vec(J_vec > 1.e-5*max(J_vec));
J_vec=J_vec(J_vec > 1.e-5*max(J_vec));

