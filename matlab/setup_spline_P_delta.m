%%%% Set up spline fits for P_delta

%%%function setup_spline_P_delta
cosmological_parameters
global C_o_global A_global zglobal delta_o_global
global pp_C_o pp_Afit

zfit=linspace(6.,10.,20);
%%%zfit=6.;
nz=length(zfit);
Afit=zeros(size(zfit));
C_o_fit=zeros(size(zfit));

lower=log(1.e-2);
upper=log(1.e6);

for i=1:nz
  zglobal=zfit(i)
  delta_o_global=delta_spline(zglobal); %%%7.61./(1+zglobal);
  guess=[0.4 0.5];
%%%%%  params=fminsearch(@setup_spline_P_delta_func,guess);
%%  C_o_fit(i)=params(1)
%%%  Afit(i)=params(2)
  C_o_fit(i)=fzero(@find_Co_func,0.66);
  C_o_global=C_o_fit(i)
  fv=quadl(@f_v_func,lower,upper);
  Afit(i)=1./fv
  A_global=Afit(i);
  fvfit(i)=quadl(@f_v_func,lower,upper);
  fmfit(i)=quadl(@f_M_func,lower,upper);
end


pp_C_o=spline(zfit,C_o_fit);
pp_Afit=spline(zfit,Afit);

Co2=C_o_spline(zfit);
A2=A_spline(zfit);

figure(1)
plot(zfit,C_o_fit,zfit,Co2,'+')
shg

figure(2)
plot(zfit,Afit,zfit,A2,'+')
shg


					  
fvfit
fmfit
