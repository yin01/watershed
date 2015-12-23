%%%% here is the ratio of the mean free path to the Lyman limit, if f(N)
%\propto N_HI^{-delta)

function y=mfp_ratip(delta)
global delta_common  
  
delta_common=delta;  

lower1=log(1.);
upper=log(10000.);

lower2=log(0.00001);

y1=quadl(@mfp_ratio1,lower1,upper);
y2=quadl(@mfp_ratio2,lower2,upper);

y=y2./y1;

  
function y=mfp_ratio1(lgtau)
global delta_common

tau=exp(lgtau);
y=(tau.^(-delta_common)).*tau;

function y=mfp_ratio2(lgtau)
global delta_common

tau=exp(lgtau);
  
y=(tau.^(-delta_common)).*(1-exp(-tau)).*tau;


