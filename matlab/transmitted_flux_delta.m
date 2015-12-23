%%%%% This computes the transmitted flux if all the gas above/below
%delta_crit is neutral 

%%% if updn==0 then integral is from delta_crit to infinity (voids are
%reionized first)
%%% if updn==1 then integral is from 0 to delta_crit (high density
%regions are reionized first)

function y=transmitted_flux_delta(delta_crit,z,updn)
global z_global 

if updn==0
  lower=log(delta_crit);
  upper=log(1.e2);
end

if updn==1
  lower=log(1.e-2);
  upper=log(delta_crit);
end

nz=length(z);
y=zeros(size(z));

for i=1:nz
  z_global=z(i);
  y(i)=quadl(@transmitted_delta_func,lower,upper,1.e-8);
end
  
function y=transmitted_delta_func(lgdelta)
global z_global

delta=exp(lgdelta);

tau= ;

y=exp(-tau).*P_delta_final(delta,z_global).*delta;