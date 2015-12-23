% non-linear mass as a function of redshift in M_solar

function y=non_linear_mass(nsigma,z)  
cosmological_parameters
global sigma_z nsig

nsig=nsigma;
lower=log(1.e4);
upper=log(1.e12);

for i=1:length(z)
sigma_z=z(i);
y(i)=exp(fzero(@non_linear_mass_func,[lower upper]));
end

function y=non_linear_mass_func(lgM)
global sigma_z nsig
  

M=exp(lgM);
sigma=sigmaM_spline(M).*growth_factor(sigma_z); %%growth_full(sigma_z);         %%%


y=1.68/sigma-nsig;

%%%%y=1.68./(sqrt(2).*sigma)-nsig;