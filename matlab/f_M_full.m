%%% This is volume fraction below delta as a function of z

function y=f_M_full(delta,z)
global zglobal_fM

zglobal_fM=z;

ndelta=length(delta);

for i=1:ndelta
  
lower=log(1.e-2);
upper=log(delta(i));

y(i)=quadl(@f_M_full_func,lower,upper);
  
end

function y=f_M_full_func(lg_delta)
global zglobal_fM

delta=exp(lg_delta);

y=P_delta_final(delta,zglobal_fM).*delta.*delta;

