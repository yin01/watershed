
function fit_eta_fardal_spline(gam_HI,gam_HeII)
global eta_fardal_spline_pp_g
  
N_HI=logspace(14,log10(5.e18),40);

eta=eta_fardal(N_HI,gam_HI,gam_HeII);

eta_fardal_spline_pp_g=spline(log(N_HI),log(eta));





