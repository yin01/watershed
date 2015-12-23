

%% this calculates J_nu
%% this can be vector-valued across E_o, but not z_o
%%% this version includes Helium

function y=J_nu_calc_He(E_o,z_o)
global z_o_g E_o_g

z_o_g=z_o;

y=zeros(size(E_o));

for i=1:length(E_o)

E_o_g=E_o(i);
z_upper=10.;
%%%%%z_upper=z_o+2.;
J=quadl(@J_nu_He_func,z_o,z_upper);

y(i)=J./4./pi./3.e24./3.;  %% convert to erg s^-1 Hz^-1 Mpc^-3
%%% note: should be dividing by (3.e24)^2, by already divided by 1.e24
%earlier in integrand to avoid roundoff-error

end

function y=J_nu_He_func(z)
global z_o_g E_o_g

z_factor=((1+z_o_g)./(1+z)).^3;  
E_now=E_o_g.*(1+z)./(1+z_o_g);
  
y=dldz(z).*z_factor.*emissivity_hopkins(E_now,z).*exp(- ...
						  tau_HI_analytic(z_o_g,z,E_o_g));

y=y.*1.e-24;   %% make it close to unity so the integrator is happy

