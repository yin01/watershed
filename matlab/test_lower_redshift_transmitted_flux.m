
%%% This gives the transmitted flux for lower redshift

z1=3.;
z2=4.;
delta_exp=2.; %% isothermal gas
nline=1; %% Lyman_alpha
F1=F_mean_becker(z1); %% transmitted flux at these redshifts
gam1=gamma_from_flux2(F1,z1,nline,delta_exp);
F2=F_mean_becker(z2); %% transmitted flux at these redshifts
gam2=gamma_from_flux2(F2,z2,nline,delta_exp);

delta=logspace(-1.3,2.);

norm1=transmitted_flux_gamma2(gam1,z1,nline,delta_exp);
alpha1=transmitted_flux_integrand(delta,gam1,z1,nline,delta_exp)./norm1;
norm2=transmitted_flux_gamma2(gam2,z2,nline,delta_exp);
alpha2=transmitted_flux_integrand(delta,gam2,z2,nline,delta_exp)./norm2;

delta_exp=1.5;
F1=F_mean_becker(z1); %% transmitted flux at these redshifts
gam1=gamma_from_flux2(F1,z1,nline,delta_exp);
F2=F_mean_becker(z2); %% transmitted flux at these redshifts
gam2=gamma_from_flux2(F2,z2,nline,delta_exp);

delta=logspace(-1.3,2.);

norm1=transmitted_flux_gamma2(gam1,z1,nline,delta_exp);
alpha3=transmitted_flux_integrand(delta,gam1,z1,nline,delta_exp)./norm1;
norm2=transmitted_flux_gamma2(gam2,z2,nline,delta_exp);
alpha4=transmitted_flux_integrand(delta,gam2,z2,nline,delta_exp)./norm2;

figure(1)
semilogx(delta,alpha1,'red',delta,alpha3,delta,alpha2,'blue',delta,alpha4)
shg

matrix=[delta' alpha1' alpha2' alpha3' alpha4'];
save lower_redshift_delta_integrand.dat matrix -ascii