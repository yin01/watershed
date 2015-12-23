%%%% This gives both the volume and mass weighted neutral fraction

function y=average_xHI_integrand(delta,gamma,z,nweight)

%%% initialize globals
gamma_common=gamma;
z_common=z;
nweight_common=nweight;  %% nweight=1 volume weighted
                         %%% nweight=2 mass weighted

weight=delta.^(nweight_common-1);
x_HI=f_HI_delta(delta,gamma_common,z_common);
y=weight.*P_delta_final(delta,z_common).*delta.*x_HI;  


