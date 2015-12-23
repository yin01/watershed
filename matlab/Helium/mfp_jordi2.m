%%% this is proportional to tau_eff


function y=mfp_jordi3(f,tau_min,tau_max)
global f_global

y=zeros(size(f));

for i=1:length(f)

f_global=f(i);

lower=tau_min;
upper=tau_max;

y(i)=quadl(@mfp_jordi_func,lower,upper);

end

function y=mfp_jordi_func(tau)
global f_global

y=(tau.^(-1.5))./(f_global^0.66667).*(1.-exp(-(f_global^1.6667).*tau));

