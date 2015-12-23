
%%% Written 26 Oct 2008
%%% This tests the ability to recover temperature from the flux


%%% FIRST JUST CHECK THAT CAPABLE OF RECOVERYING FLUX
gam_true=1.;
T_true=7000.;
gam_input=gam_true.*((T_true./1.e4).^0.7);
delta_exp=2.;
z=6.;
flux=transmitted_flux_gamma2(gam_input,z,1,delta_exp);

T_recovered=temperature_from_flux(flux,z,gam_true,1,delta_exp);

%%% now compute the ratio (T_alpha/T_beta) from Steve's models

steve_model_data;

z=[4. 5. 6.];
gam_true=[0.4 0.2 0.1];  %% note: the actual value of gamma doesn't matter so much
              %since it cancels out
	      
%% all ratios for T2	      

flux1=exp(-tau_alpha_zr_6_T2);
T1a=temperature_from_flux(flux1,z,gam_true,1,delta_exp);
flux2=exp(-tau_beta_zr_6_T2);
T2a=temperature_from_flux(flux2,z,gam_true,2,delta_exp);
T_ratio_zr_6_T2=T1a./T2a;

flux1=exp(-tau_alpha_zr_7_T2);
T1b=temperature_from_flux(flux1,z,gam_true,1,delta_exp);
flux2=exp(-tau_beta_zr_7_T2);
T2b=temperature_from_flux(flux2,z,gam_true,2,delta_exp);
T_ratio_zr_7_T2=T1b./T2b;

flux1=exp(-tau_alpha_zr_10_T2);
T1c=temperature_from_flux(flux1,z,gam_true,1,delta_exp);
flux2=exp(-tau_beta_zr_10_T2);
T2c=temperature_from_flux(flux2,z,gam_true,2,delta_exp);
T_ratio_zr_10_T2=T1c./T2c;

flux1=exp(-tau_alpha_zr_6_T3);
T1d=temperature_from_flux(flux1,z,gam_true,1,delta_exp);
flux2=exp(-tau_beta_zr_6_T3);
T2d=temperature_from_flux(flux2,z,gam_true,2,delta_exp);
T_ratio_zr_6_T3=T1d./T2d;

flux1=exp(-tau_alpha_zr_7_T3);
T1e=temperature_from_flux(flux1,z,gam_true,1,delta_exp);
flux2=exp(-tau_beta_zr_7_T3);F_a
T2e=temperature_from_flux(flux2,z,gam_true,2,delta_exp);
T_ratio_zr_7_T3=T1e./T2e;

flux1=exp(-tau_alpha_zr_10_T3);
T1f=temperature_from_flux(flux1,z,gam_true,1,delta_exp);
flux2=exp(-tau_beta_zr_10_T3);
T2f=temperature_from_flux(flux2,z,gam_true,2,delta_exp);
T_ratio_zr_10_T3=T1f./T2f;


figure(1)
plot(z,T_ratio_zr_6_T2,z,T_ratio_zr_7_T2,z,T_ratio_zr_10_T2)
shg

figure(2)
plot(z,T_ratio_zr_6_T3,z,T_ratio_zr_7_T3,z,T_ratio_zr_10_T3)
shg


%%% save all workspace variables

save test_temperature_recovery.mat