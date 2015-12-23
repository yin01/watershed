%%%%% this computes N_HI from N_HeII

function y=N_HI_from_N_HeII(N_HeII,z,Gamma_HI,Gamma_HeII)
global N_He_g3 gam_H_g3 gam_He_g3

gam_H_g3=Gamma_HI;
gam_He_g3=Gamma_HeII;

y=zeros(size(N_HeII));

for i=1:length(N_HeII)
    
    N_He_g3=N_HeII(i);
    y(i)=exp(fzero(@NHI_solve_func,log(1.e12),log(1.e22)));
end
