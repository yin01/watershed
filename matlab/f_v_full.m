%%% This is volume fraction below delta as a function of z

function y=f_v_full(delta,z)
global zglobal_fv

zglobal_fv=z;

ndelta=length(delta);

for i=1:ndelta
  
lower=log(1.e-2);
upper=log(delta(i));

%%lower=log(delta(i));
%%%upper=log(1.e5);

y(i)=quadl(@f_v_full_func,lower,upper);
  
end

function y=f_v_full_func(lg_delta)
global zglobal_fv
  
delta=exp(lg_delta);

y=P_delta_final(delta,zglobal_fv).*delta;

