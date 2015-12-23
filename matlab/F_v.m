%%% fraction of volume BELOW a certain overdensity delta

function y=F_v(delta)
  
ndelta=length(delta);
y=zeros(size(delta));

for i=1:ndelta

lower=log(delta(i));
upper=log(1.e6);

y(i)=quadl(@F_v_func,lower,upper);

end

function y=F_v_func(log_delta);
  
delta=exp(log_delta);

y=P_delta(delta).*delta;