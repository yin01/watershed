%%% This is in response to referee report (written 11 Dec 2004)

%% input: flux, deltaz, line number

%%% output: total tau, line optical depth


%%% INPUT VARIABLES
flux=3.8;
flux_err=1.7;

deltaz=0.05;

line_number=3;
delta_exp=3;


%%% FIXED VARIABLES

z=6.245;


%%% different line numbers

if line_number==1
  continuum=1910.;
  tau_tot=-log(flux/continuum)
  err_tau_tot=flux_err/flux
end

if line_number==2
  continuum=1870;
  tau_tot=-log(flux/continuum)
  err_tau_tot=flux_err/flux
  err_alpha= 0.32.*sqrt(0.15/deltaz);
  tau_beta=tau_tot-2.38
  err_beta=sqrt(err_tau_tot.^2+err_alpha.^2)
  flux=exp(-tau_beta);
  gam=gamma_from_flux2(flux,z,line_number,delta_exp);
  tau_eff=-log(transmitted_flux_gamma2(gam,z,1,delta_exp))
  err_tau_eff=err_beta.*(tau_eff./tau_beta)
end  

if line_number==3
  continuum=1910;
  tau_tot=-log(flux/continuum)
  err_tau_tot=flux_err/flux
  err_fg=0.25*sqrt(0.15/deltaz);
  tau_gam=tau_tot-3.54
  err_gam=sqrt(err_tau_tot.^2+err_fg.^2)
  flux=exp(-tau_gam);
  gam=gamma_from_flux2(flux,z,line_number,delta_exp);
  tau_eff=-log(transmitted_flux_gamma2(gam,z,1,delta_exp))
  err_tau_eff=err_gam.*(tau_eff./tau_gam)
end  