%%% written Dec 29, 2008
%%% this is a very approximate fit to dN/dz= 3.3 [(1+z)/5]^1.5 
%%% and dN/dN_HI \propto N^-1.5
%% for hydrogen opacity ONLY
%% z1, z2 is starting and ending redshift
%% E is OBSERVED energy of photon in eV

function y=tau_eff_HI_approx(z1,z2,E)

y=zeros(size(z2));  
  
for i=1:length(z2)  
  
N_factor=quadl(@tau_eff_approx_func,z1,z2(i));
E_factor=(E./13.6).^(-1.5);
y(i)=sqrt(pi).*N_factor.*E_factor;
y(i)=abs(y(i));

end

function y=tau_eff_approx_func(z)
  
y=3.3.*(((1+z)./5.).^1.5);
