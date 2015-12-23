function y=d_M2(z) %% in Mpc
cosmological_parameters

nz=length(z);
y=zeros(size(z));

for i=1:nz

  y(i)=quadl(@d_M_integrand,0,z(i));
end

  y=3000.*y./h;

function y=d_M_integrand(z)
cosmological_parameters 
  
%y=((1.+z).^2).*(1.+Omega_m.*z)-z.*(2.+z)*Omega_lambda;
%y=1./sqrt(y);

a=1./(1+z);

y=1./H_a(a); 
