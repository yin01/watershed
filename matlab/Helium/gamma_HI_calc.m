
%%% this calculates the ionization rate at each redshift


function y=gamma_HI_calc(z)
global E_vec_g J_vec_g
  
[E_vec_g,J_vec_g]=fit_J_nu_spline(z);

lower=log(min(E_vec_g));
upper=log(max(E_vec_g));

y1=quadl(@gamma_HI_calc_func,lower,log(40.8));
y2=quadl(@gamma_HI_calc_func,log(40.8),upper);


y=(y1+y2).*1.e-12./6.63e-27;



function y=gamma_HI_calc_func(lgE)
global E_vec_g J_vec_g
 
E=exp(lgE);


y=4.*pi.*power_law_spline(E_vec_g,J_vec_g,E).*sigma_HI(E);

y=y.*1.e12;


