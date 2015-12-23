%%% written 

%% input: nline, measured tau, z, gamma which would give this tau, and frac_flux
%%% which is the fraction of flux contributed from delta = 0. to the
%critical overdensity 
%%%% tau, z, gamma can be vectors, but frac must be a scalar

function y=delta_crit_from_frac(tau,z,gam,nline,delta_e,frac_flux)
global flux_g z_g gam_g nline_g delta_e_g
  
npts=length(tau);
delta_e_g=delta_e;
y=zeros(size(z));

nline_g=nline;

for i=1:npts
  tau_g=tau(i);
  z_g=z(i);
  gam_g=gam(i);
  flux_g=exp(-tau(i)).*frac_flux;
  y(i)=exp(fzero(@delta_crit_from_frac_func,[log(1.5e-2) log(99.)])); 
end



function y=delta_crit_from_frac_func(lgdelta)
global flux_g z_g gam_g nline_g delta_e_g

delta_upper=exp(lgdelta);

tau=-log(transmitted_flux_delta2(gam_g,z_g,nline_g,delta_e_g,delta_upper));

y=transmitted_flux_delta2(gam_g,z_g,nline_g,delta_e_g,delta_upper)-flux_g;

