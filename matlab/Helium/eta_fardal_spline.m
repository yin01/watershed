
function y=eta_fardal_spline(N_HI)
global eta_fardal_spline_pp_g

y=exp(ppval(eta_fardal_spline_pp_g,log(N_HI)));

%%% still constant below 1.e14
y(N_HI<1.e14)=exp(ppval(eta_fardal_spline_pp_g,log(1.e14))).*N_HI(N_HI<1.e14)./N_HI(N_HI<1.e14);

%% eta \propto 1/N_HI above 5.e18
y(N_HI>5.e18)=exp(ppval(eta_fardal_spline_pp_g,log(5.e18))).*(5.e18./N_HI(N_HI>5.e18));
