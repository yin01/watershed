%%% this is the input function for for mfp
%%% do this as an integral over dN 

function y=mfp_fardal_func(lgN_HI)
global E_g Q_g gam_H_g gam_He_g z_g

N_HI=exp(lgN_HI);

eta=eta_fardal(N_HI,gam_H_g,gam_He_g);

N_HeII=eta.*N_HI;

%%%%dzdl=1./dproper_from_delta_z(1,z_g);

tau=N_HeII.*sigma_HeII(E_g);

y=N_HI.*fN_fardal(N_HI,z_g).*(1-exp(-tau));

