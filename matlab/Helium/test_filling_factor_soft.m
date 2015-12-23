

%%% this computes the maximum filling factor you can get with soft
%photons

global pp_nphot_g pp_d_nphot_g

mat=load('hopkins_C0_m1.dat');

z=mat(:,1);
nphot=mat(:,2);  %% number of photons per He atom

pp_nphot_g=spline(z,nphot);
pp_d_nphot_g=fnder(pp_nphot_g);


[z1,Q1]=ode45(@dQdz_LLS_no_recomb,[7.5 2.5],1.e-2);
[z2,Q2]=ode45(@dQdz_LLS_C1,z1,1.e-2);
[z3,Q3]=ode45(@dQdz_C1,z1,1.e-2);
[z4,Q4]=ode45(@dQdz_C3,z1,1.e-2);


Q_no_clump=fnval(pp_nphot_g,z1);

plot(z1,Q_no_clump,z1,Q1,z2,Q2,z3,Q3,z4,Q4)


matrix=[z1 Q_no_clump Q1 Q2 Q3 Q4];

save filling_factor_soft.dat matrix -ascii 




