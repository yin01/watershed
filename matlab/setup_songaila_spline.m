
%%% this reads in songaila's data and sets up the spline fit

global pp_song_alpha pp_song_beta pp_song_gamma


fg_ly_alpha_mat=load('~peng/iDisk/reion/matlab/data/ly_alpha_songaila_04.dat');
fg_ly_beta_mat=load('~peng/iDisk/reion/matlab/data/ly_beta_songaila_04.dat');
fg_ly_gamma_mat=load('~peng/iDisk/reion/matlab/data/ly_gamma_songaila_04.dat');

z_a=fg_ly_alpha_mat(:,1);
F_a=fg_ly_alpha_mat(:,2);
F_a_lower=fg_ly_alpha_mat(:,4);
F_a_upper=fg_ly_alpha_mat(:,3);

z_b=fg_ly_beta_mat(:,1);
F_b=fg_ly_beta_mat(:,2);
F_b_lower=fg_ly_beta_mat(:,4);
F_b_upper=fg_ly_beta_mat(:,3);

z_g=fg_ly_gamma_mat(:,1);
F_g=fg_ly_gamma_mat(:,2);
F_g_lower=fg_ly_gamma_mat(:,4);
F_g_upper=fg_ly_gamma_mat(:,3);

tau_a=-log(F_a);
[pp_song_alpha, p_alpha]=csaps(log(1+z_a),log(tau_a),0.999);
tau_b=-log(F_b)-tau_a_song_spline(z_fg_alpha_zb(z_b));  %%% there is
                                                        %something weird
                                                        %here!!! 
[pp_song_beta, p_alpha]=csaps(log(1+z_b),log(tau_b),0.999);
tau_g=-log(F_g);
[pp_song_gamma, p_alpha]=csaps(log(1+z_g),log(tau_g),0.999);


za=linspace(3,6);
tau_a_fit=exp(fnval(pp_song_alpha,log(1+za)));
zb=linspace(min(z_b),max(z_b));
tau_b_fit=exp(fnval(pp_song_beta,log(1+zb)));
zg=linspace(3,6);
tau_g_fit=exp(fnval(pp_song_gamma,log(1+zg)));

tau_a2=tau_a_power(za);
tau_b2=tau_b_power(zb);

figure(1)
plot(za,tau_a_fit,za,tau_a2,z_a,tau_a,'+')
shg

figure(2)
plot(zb,tau_b_fit,zb,tau_b2,z_b,tau_b,'+')
shg

figure(3)
plot(zg,tau_g_fit,z_g,tau_g,'+')
shg

