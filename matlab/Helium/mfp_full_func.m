%%% this is the input function for for mfp
%%% do this as an integral over dN 

function y=mfp_full_func(lgN_HI)
global E_g gam_H_g gam_He_g z_g

N_HI=exp(lgN_HI);

[N_H N_HeI N_HeII N_HeIII]=N_all_from_N_HI(N_HI,gam_H_g,gam_He_g);


%%%%dzdl=1./dproper_from_delta_z(1,z_g);

tau=N_HI.*sigma_HI(E_g)+ N_HeI.*sigma_HeI(E_g) + N_HeII.*sigma_HeII(E_g);

y=N_HI.*fN_fardal(N_HI,z_g).*(1-exp(-tau));

