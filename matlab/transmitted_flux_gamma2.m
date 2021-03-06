%%%% This gives the transmitted flux as a function of the assumed
%%% radiation field gamma

function y=transmitted_flux_gamma2(gamma,z,nline,delta_e)
global gamma_global zglobal nline_global delta_exp

delta_exp=delta_e;   %%% tau \propto delta^(delta_exp)

nz=length(z);
y=zeros(size(z));

for i=1:nz  
gamma_global=gamma(i);
zglobal=z(i);
nline_global=nline;

lower=log(1.e-2);
upper=log(1.e2);  %%% don't push this to higher delta---it's totally unreliable
 
y(i)=quadl(@transmitted_flux_func,lower,upper,1.e-8);

end
  
function y=transmitted_flux_func(lgdelta)
global gamma_global zglobal nline_global delta_exp

if nline_global==1
  suppress_factor=1.;
end

if nline_global==2  %%% Lyman beta
  suppress_factor=6.241;
%%%%   suppress_factor=5.27;
end

if nline_global==3 %%% Lyman gamma
  suppress_factor=17.83;
end
  

delta=exp(lgdelta);

tau_o=82./suppress_factor;

tau=tau_o.*(((1+zglobal)./7).^4.5).*(0.05/gamma_global).*(delta.^(delta_exp));

y=exp(-tau).*P_delta_final(delta,zglobal).*delta;

%%%%y=P_delta_final(delta,zglobal).*delta.*delta;