function y=NHI_solve_func(lgN_HI)
global N_He_g3 gam_H_g3 gam_He_g3

N_HI=exp(lgN_HI);

y=N_He_g3-eta_fardal(N_HI,gam_H_g3,gam_He_g3).*N_HI;