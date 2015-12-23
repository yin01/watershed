

%%% get the temperatures from xiaohui's data


read_xiaohui_data;

gam=ones(size(z));

delta_exp=2.5;

T_alpha=temperature_from_flux(F_alpha,z,gam,1,delta_exp);
T_beta=temperature_from_flux(F_beta,z,gam,2,delta_exp);

T_ratio=T_alpha./T_beta;

plot(z,T_ratio)

%% save all workspace variables

save test_xiaohui_temperatures_inverted.mat