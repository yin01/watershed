%%% test the steepest descent integral which songaila provides

z=linspace(3,6.1,10);
delta_exp=2-0.7*0.6;

tau_alpha=tau_a_song_spline(z);
gam=gamma_from_flux2(exp(-tau_alpha),z,1,delta_exp);

tau_beta=-log(transmitted_flux_gamma2(gam,z,2,delta_exp));

tau_a_song=-log(transmitted_flux_songaila(gam,z,1));
tau_b_song=-log(transmitted_flux_songaila(gam,z,2));

delta_a=1.-tau_a_song./tau_alpha;
delta_b=1.-tau_b_song./tau_beta;

plot(z,delta_a,z,delta_b)
%%ylim[(0.2 -0.2])
shg
