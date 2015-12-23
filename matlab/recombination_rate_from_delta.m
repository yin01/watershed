%%%% recombination rate per Hubble time per baryon in the universe if it
%is ionized up to overdensity delta
%%% MARCH 23 2005: REVISED SO THAT USE P_FINAL


function y=recombination_rate_from_delta(delta,z)
global z_common
  
z_common=z;

ndelta=length(delta);
y=zeros(size(delta));

for i=1:ndelta

lower=log(1.e-2);
upper=log(delta(i));

y(i)=quadl(@grr_func,lower,upper);

end

n=2.e-7.*((1+z).^3);
t_rec=1./(4.e-13*n)./3.e7;
%%%R_u=t_H(z)./t_rec; %%% ratio of recombination rate to Hubble constant 
R_u=1.;
y=y.*R_u;
  
  
function y=grr_func(log_delta);
global z_common
  
delta=exp(log_delta);

y=P_delta_final(delta,z_common).*(delta.^3);