%%% This shows the integrand of the transmitted flux function
%%% to show where it peaks for different objects

  
function y=transmitted_flux_integrand(delta,gamma,z,nline,delta_exp)

if nline==1
  suppress_factor=1.;
end

if nline==2  %%% Lyman beta
  suppress_factor=6.241;
%%%%   suppress_factor=5.27;
end

if nline==3 %%% Lyman gamma
  suppress_factor=17.83;
end
  

%%delta=exp(lgdelta);

tau_o=82./suppress_factor;

tau=tau_o.*(((1+z)./7).^4.5).*(0.05/gamma).*(delta.^(delta_exp));

y=exp(-tau).*P_delta_final(delta,z).*delta;