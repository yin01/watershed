%%% This is volume fraction ABOVE delta as a function of z

function y=f_v_down_full(delta,z)
global zglobal_fv


ndelta=length(delta);
nz=length(z);

if (ndelta >=nz) 
  zglobal_fv=z;


  for i=1:ndelta
  
        lower=log(delta(i));
        upper=log(1.e5);

	y(i)=quadl(@f_v_full_func,lower,upper);
  end

else
  for i=1:nz
    zglobal_fv=z(i);
  
        lower=log(delta);
        upper=log(1.e5);

	y(i)=quadl(@f_v_full_func,lower,upper);
  end

  
end

function y=f_v_full_func(lg_delta)
global zglobal_fv
  
delta=exp(lg_delta);

y=P_delta_final(delta,zglobal_fv).*delta;

