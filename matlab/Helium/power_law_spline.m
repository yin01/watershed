

%% this fits a spline to the power law

function z=power_law_spline(x_vec,y_vec,x_eval)
  
lgx=log(x_vec);
lgy=log(y_vec);
lg_xeval=log(x_eval);

z=exp(spline(lgx,lgy,lg_xeval));