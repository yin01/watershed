
%%% this compares the relative fractional contribution of different
%things to the optical depth

E_He=54.4;
E_up=E_He.*9;
E=linspace(E_He,E_up);
z=3.;
tau_fixed=2.;

%%% things might want to change %%%%
r_ion=0.;
Q1=0.1;
Q2=0.5;
Q3=0.9;

r_ion2=5.;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[r,P_abs1]=P_abs_LLS(E,r_ion,Q1,z,tau_fixed);
[r,P_abs2]=P_abs_LLS(E,r_ion,Q2,z,tau_fixed);
[r,P_abs3]=P_abs_LLS(E,r_ion,Q3,z,tau_fixed);

[r2,P_abs1b]=P_abs_LLS(E,r_ion2,Q1,z,tau_fixed);
[r2,P_abs2b]=P_abs_LLS(E,r_ion2,Q2,z,tau_fixed);
[r2,P_abs3b]=P_abs_LLS(E,r_ion2,Q3,z,tau_fixed);

plot(E,P_abs1,E,P_abs2,E,P_abs3,E,P_abs2b)
shg

matrix=[E' P_abs1' P_abs2' P_abs3' P_abs2b'];

save tau_frac.dat matrix -ascii 