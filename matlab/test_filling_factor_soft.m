
%%% this computes the maximum filling factor you can get with soft
%photons

global pp_nphot_g pp_d_nphot_g

mat=load('hopkins_C0_m1.dat');

z=mat(:,1);
nphot=mat(:,2);  %% number of photons per He atom

pp_nphot_g=spline(z,nphot);
pp_d_nphot_g=fnder(pp_nphot_g);


[z_out,Q_out]=ode45(@dQdz,[7.5 2.5],1.e-2);

Q_no_clump=fnval(pp_nphot_g,z_out);

plot(z_out,Q_no_clump,z_out,Q_out)
shg




