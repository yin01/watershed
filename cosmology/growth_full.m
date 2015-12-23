%% full growth factor, computed from integral
%% adopt normalization s.t. growth factor is 1 at present time

function y=growth_full(z)
cosmological_parameters

a=1./(1+z);

for i=1:length(a)
integral(i)=quadl(@growth_integrand,0,a(i));
end

norm=quadl(@growth_integrand,0,1);
%%%norm=1./(H_a(1).*norm);
norm=2.5.*Omega_m;

y=norm.*H_a(a).*integral;
  
function y=growth_integrand(a)
  
y=1./(a.*H_a(a)).^3;