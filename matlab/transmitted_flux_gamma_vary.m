%%%% This gives the transmitted flux as a function of the assumed
%radiation field gamma
%%%%% BUT this allows for a varying radiation field with a lognormal
%distribution
%%% with gamma_bar the mean and
%%% sig_lggamma the dispersion in log_gamma

function y=transmitted_flux_gamma_vary(gamma_bar,sig_lggamma,z,nline,delta_e)
global gamma_bar_global sig_lggamma_global zglobal nline_global delta_exp

delta_exp=delta_e;   %%% tau \propto delta^(delta_exp)

nz=length(z);
y=zeros(size(z));

for i=1:nz

gamma_bar_global=gamma_bar(i);
sig_lggamma_global=sig_lggamma(i);
zglobal=z(i);
nline_global=nline;

%%delta_lower=log(1.e-2);
%%%delta_upper=log(1.e2);  %%% don't push this to higher delta---it's totally unreliable
gamma_lower=log(1.e-2);
gamma_upper=log(4.);

%%gamma_lower=0.;
%%%gamma_upper=1.;

delta_lower=log(1.e-2);
delta_upper=log(1.e2);
%%gamma_lower=0.;
%%gamma_upper=1.;

y(i)=dblquad(@tflux_gamma_vary_func,delta_lower,delta_upper,gamma_lower,gamma_upper,1.e-10,@quadl);

end
  
function y=tflux_gamma_vary_func(lgdelta,lggamma)
global gamma_bar_global sig_lggamma_global zglobal nline_global delta_exp


if nline_global==1
  suppress_factor=1.;
end

if nline_global==2  %%% Lyman beta
  suppress_factor=6.241;
end

if nline_global==3 %%% Lyman gamma
  suppress_factor=17.83;
end
  
delta=exp(lgdelta);
gam=exp(lggamma);

tau_o=82./suppress_factor;

tau=tau_o.*(((1+zglobal)./7).^4.5).*(0.05/gam).*(delta.^(delta_exp));


density_PDF=exp(-tau).*P_delta_final(delta,zglobal).*delta;
%%%y=exp(-tau).*P_delta_final(delta,zglobal).*delta.*lognormal_dist(gamma,gamma_bar_global,sig_lggamma_global).*gamma;

%%gaussian=1./sqrt(2.*pi).*exp(-0.5.*(delta.^2)).*delta;
gaussian=1./sqrt(2.*pi).*exp(-0.5.*(gam.^2)).*gam;


ln_dist=lognormal_dist(gam,gamma_bar_global,sig_lggamma_global).*gam;
%%%PDF=ones(size(gam));
PDF=density_PDF;
PDF2=ln_dist;

%%%%%y=exp(-tau).*P_delta_final(delta,zglobal).*delta;

y=PDF.*PDF2;