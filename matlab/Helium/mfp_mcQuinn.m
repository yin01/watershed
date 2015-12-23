%%% this gives the mfp in McQuinn's formula
%%% can either have E as a vector, or N_HI_min

%%% this calculates the mfp (in COMOVING Mpc)
%%%% as a function of energy E (in eV) using the eta scaling from the fardal
%% fN
%%% also required as input is the ionized filling factor Q
%%% gamma_H and gamma_He, the ionizing background at those redshifts

function y=mfp_McQuinn(E,N_HI_min,gamma_H,gamma_He,z)
global E_g gam_H_g gam_He_g z_g

%% initialize global variables


%%%Q_g=Q;
gam_H_g=gamma_H;
gam_He_g=gamma_He;
z_g=z;

%% integrate

if (length(E) > 1) 

  lower=log(1.e13);
  upper=log(1.e20);

  mfp_integral=zeros(size(E));

  for i=1:length(E)
  
    E_g=E(i);
    mfp_integral(i)=quadl(@mfp_McQuinn_func,lower,upper);
  end

else
  
  mfp_integral=zeros(size(N_HI_min));
  E_g=E;
  
  for i=1:length(N_HI_min)
    lower=log(N_HI_min(i));
    upper=log(1.e22);
    mfp_integral(i)=quadl(@mfp_McQuinn_func,lower,upper);
  end
      
end %%% end the if statement
  

delta_z=1./(mfp_integral);

y=dproper_from_delta_z(delta_z,z).*(1+z);

