%% density of HI
function y=Omega_HI(z)
cosmological_parameters

for i=1:length(z)
zf=z(i);
y(i)=quadl(@Omega_HI_func,0,zf);
end

Omega_crit=277.3*h*h*1.e9; %% in M_solar Mpc^-3

y=-y./Omega_crit;

y=y+10^-3.52; %% initial value

function y=Omega_HI_func(z)
cosmological_parameters

dtdz=1./dzdt(z);

y=SFR_PM3(z).*dtdz;