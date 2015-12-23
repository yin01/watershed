


ly_alpha_mat=load('data/tau_alpha-0607.dat');
ly_beta_mat=load('data/tau_beta-0607.dat');

z2=ly_alpha_mat(:,1);
F_alpha2=ly_alpha_mat(:,2);
delta_F_alpha2=ly_alpha_mat(:,3);

F_beta2=ly_beta_mat(:,2);
delta_F_beta2=ly_beta_mat(:,3);

%% only trust 2 sigma detections of flux 

%%%trim_index=find(F_alpha >= 2.*delta_F_alpha);

trim_index=find((F_alpha2 > 0) & (F_beta2 > 0));

%% '2' correponds to the trimmed cases
%% may be a biased sample....

z=z2(trim_index);

F_alpha=F_alpha2(trim_index);
delta_F_alpha=delta_F_alpha2(trim_index);

F_beta=F_beta2(trim_index);
%% subtract off foreground Ly-alpha absorption 
F_beta=F_beta.*exp(tau_alpha_fg(z));
delta_F_beta=delta_F_beta2(trim_index);

