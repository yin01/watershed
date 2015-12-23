%%%% This gives both the volume and mass weighted neutral fraction

function y=average_neutral_fraction(gamma,z,nweight)
global gamma_common z_common nweight_common


%%% initialize globals
z_common=z;

nweight_common=nweight;  %% nweight=1 volume weighted
                         %%% nweight=2 mass weighted
			 %%% nweight=3 optical depth weighted
ng=length(gamma);
y=zeros(size(gamma));
			 
%%% do integral

for i=1:ng 
  
gamma_common=gamma(i);

lower=log(1.e-2);
upper=log(1.e6);

if nweight==3 
  y(i)=quadl(@average_nfraction_flux_func,lower,upper);
  
  y(i)=y(i)/transmitted_flux_gamma(gamma,z,1);
  
else
  y(i)=quadl(@average_nfraction_func,lower,upper);
end
  
  
end
  
  
function y=average_nfraction_func(lgdelta)
global gamma_common z_common nweight_common

delta=exp(lgdelta);
weight=delta.^(nweight_common-1);
x_HI=f_HI_delta(delta,gamma_common,z_common);
y=weight.*P_delta_final(delta,z_common).*delta.*x_HI;  

function y=average_nfraction_flux_func(lgdelta)
global gamma_common z_common nweight_common

delta=exp(lgdelta);
%%%%%%weight=transmitted_flux_gamma(gamma_common,z_common,1);
suppress_factor=1.;
tau_o=82./suppress_factor;
tau=tau_o.*(((1+z_common)./7).^4.5).*(0.05/gamma_common).*(delta.^(2));
weight=exp(-tau);
x_HI=f_HI_delta(delta,gamma_common,z_common);
y=weight.*P_delta_final(delta,z_common).*delta.*x_HI;  




