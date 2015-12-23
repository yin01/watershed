%%% written Jan 1, 2009
%%% this is EXACT SOLUTION to dN/dz= 3.3 [(1+z)/5]^1.5 
%%% and dN/dN_HI \propto N^-1.5
%% for hydrogen opacity ONLY
%% z1, z2 is starting and ending redshift
%% E is OBSERVED energy of photon in eV


function y=tau_eff_HeII_exact(z1,z2,E)
global E_prime_g

%% initialize global variable
if (z1<z2)&(length(z1)==1) 
  E_prime_g=E./(1+z1);
else
  disp('z1 is larger than z2')
  pause
end

y=zeros(size(z2));

for i=1:length(z2)

y(i)=dblquad(@tau_exact_HeII_func,log(1.e12),log(1.e20),z1,z2(i));

y(i)=abs(y(i));

end
  
  
function y=tau_exact_HeII_func(lgN,z)
global E_prime_g
  
N_HI=exp(lgN);

E=E_prime_g.*(1+z);

y=N_HI.*fN_single_power_law(N_HI,z).*(1-exp(-eta_fardal_spline(N_HI).*N_HI.*sigma_HeII(E)));