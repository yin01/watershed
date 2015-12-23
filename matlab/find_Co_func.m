function y=find_Co_func(Co)
global C_o_global A_global zglobal delta_o_global
  
C_o_global=Co;
A_global=1.;

lower=log(1.e-2);
upper=log(1.e6);

fv=quadl(@f_v_func,lower,upper);
fm=quadl(@f_M_func,lower,upper);


%%%%y=(fv-1).^2+(fm-1).^2;

y=fv-fm;