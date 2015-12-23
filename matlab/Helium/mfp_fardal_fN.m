%%% this calculates the mfp (in PROPER Mpc)
%%%% as a function of energy E (in eV) using the eta scaling from the fardal
%% fN
%%% also required as input is the ionized filling factor Q
%%% gamma_H and gamma_He, the ionizing background at those redshifts

function y=mfp_fardal_fN(E,Q,gamma_H,gamma_He,z)
global E_g Q_g gam_H_g gam_He_g z_g

%% initialize global variables


Q_g=Q;
gam_H_g=gamma_H;
gam_He_g=gamma_He;
z_g=z;

%% integrate

lower=log(1.e13);
upper=log(1.e20);

mfp_integral=zeros(size(E));

for i=1:length(E)
  
  E_g=E(i);
  mfp_integral(i)=quadl(@mfp_fardal_func,lower,upper);
 
end

delta_z=1./mfp_integral;

y=dproper_from_delta_z(delta_z,z);

