
%%% this has to contributions to optical depth from Helium LLS. 
%%% it IGNORES the contribution from stuff below N_LLS
%%% (in principle, if you put that in, have to multiply by sqrt(pi)

%%% r is the distance travelled by the photon in PROPER Mpc

function y=tau_eff_He_LLS(r,E,z)

nu_factor=(E./54.4).^(-1.5);

r_factor=r./mfp_He_LLS(z);

y=nu_factor.*r_factor;

