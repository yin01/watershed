function y=f_M_func(lg_delta)
global C_o_global A_global zglobal delta_o_global
  
delta=exp(lg_delta);
y=P_delta_full(delta,zglobal,A_global,delta_o_global,C_o_global).*delta.*delta;
