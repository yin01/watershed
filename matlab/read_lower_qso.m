%%% Read in the quasar data

%%%load -ascii qso_z_637_hi_res.txt
z_qso=6.28;
spectrum=load('qso_z_628_lo_res.txt');
noise_mat=load('noise_z_628_lo_res.txt');
%%spectrum=load('qso_z_637_lo_res.txt');
%%%noise_mat=load('noise_z_637_lo_res.txt');


lambda_ref=[1215.6701 1025.7223 972.5368 949.7431 937.8035 930.7483 926.2257 ...
	   923.1504 920.9631];

fosc_ref=[0.416 0.790e-1 0.290e-1 0.139e-1 0.780e-2 0.482e-2 0.319e-2 ...
	  0.222e-2 0.160e-2];

%%% now get the ratio of optical depths normalized to Ly-alpha

z_lower=5.80;
z_upper=5.95;

tau_ref=lambda_ref.*fosc_ref./(lambda_ref(1)*fosc_ref(1));

lambda=10.^(spectrum(:,1));
flux=spectrum(:,2);
noise=noise_mat(:,2);
fit_LBQS_continuum(z_qso,lambda,flux)



z_alpha=lambda./lambda_ref(1)-1;
z_beta=lambda./lambda_ref(2)-1;
z_gamma=lambda./lambda_ref(3)-1;

z1=z_lower;
z2=z_upper;

flux_plot=flux.*1.e18;

figure(1)
bar(z_alpha,flux_plot)
axis([z1 z2 -1 30])
shg

figure(2)
bar(z_beta,flux_plot)
axis([z1 z2 -1 30])
shg

figure(3)
bar(z_gamma,flux_plot)
axis([z1 z2 -0.3 30])
shg

%%%% check spectral resolution

delta_lambda=diff(lambda);
R=lambda(1:end-1)./delta_lambda;

%%% now check numbers in table 1

new_noise=noise_from_adj(noise);

%%%%new_noise=noise;

%%%new_noise=noise;

index_alpha1=find((z_alpha>z_lower)&(z_alpha<z_upper));
index_beta1=find((z_beta>z_lower)&(z_beta<z_upper));
index_gamma1=find((z_gamma>z_lower)&(z_gamma<z_upper));


Ly_alpha1=mean_inv_var(index_alpha1,flux,new_noise).*1.e20
Ly_beta1=mean_inv_var(index_beta1,flux,new_noise).*1.e20
Ly_gamma1=mean_inv_var(index_gamma1,flux,new_noise).*1.e20



lineno=2

if lineno==1 
  suppress=1.;
  osc_factor=1.;
else
  suppress=0.11;
  osc_factor=fosc_ref(1)*lambda_ref(1)/(fosc_ref(lineno)*lambda_ref(lineno)) 
end

lambda_min=lambda_ref(lineno).*(1+z_lower)
lambda_max=lambda_ref(lineno).*(1+z_upper)

%%lambda_min=8630;
%%lambda_max=8900;

%%lambda_min=10000;
%%lambda_max=10100;

if lineno==1
line_flux=Ly_alpha1(1);
err_flux=Ly_alpha1(2);
end

if lineno==2
line_flux=Ly_beta1(1);
err_flux=Ly_beta1(2);
end

if lineno==3
line_flux=Ly_gamma1(1);
err_flux=Ly_gamma1(2);
end


continuum1=telfer1_continuum(z_qso,lambda,flux,lambda_min,lambda_max)* ...
	  1.e20 %%%*suppress

%%% read in LBQS continuum

%%%%continuum1=LBQS_mean_flux(lambda_min,lambda_max)*1.e20

transmission_fraction=line_flux/continuum1
err_transmission=err_flux/continuum1
tau_tot=-log(transmission_fraction)
err_tau=err_flux/line_flux %%*osc_factor
%%%%err_tau=err_transmission/transmission_fraction;
line_flux
err_flux

if lineno==2
  tau_eff=(tau_tot-2.38)*(7.8/3.0)
end

if lineno==3
  tau_eff=(tau_tot-3.54)*(11.5/2.5)
end

