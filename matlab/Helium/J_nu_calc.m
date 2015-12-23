

%% this calculates J_nu
%% this can be vector-valued across E_o, but not z_o

function y=J_nu_calc(E_o,z_o)
global z_o_g E_o_g

z_o_g=z_o;

y=zeros(size(E_o));

for i=1:length(E_o)

E_o_g=E_o(i);
z_upper=54.4.*(1+z_o)./E_o(i);
%%%%%z_upper=z_o+2.;
J=quadl(@J_nu_calc_func,z_o,z_upper);

y(i)=J./4./pi./3.e24./3.;  %% convert to erg s^-1 Hz^-1 Mpc^-3
%%% note: should be dividing by (3.e24)^2, by already divided by 1.e24
%earlier in integrand to avoid roundoff-error

end

