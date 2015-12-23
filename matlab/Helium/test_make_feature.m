
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


figure(1)
plot(z1,Q_no_clump,z1,Q1,z2,Q2,z3,Q3,z4,Q4)


%%%%%%%%%%%% NEW STUFF %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Ly_alpha_emiss=abs(Q1.*dnphot_dz(z1));   %%% in units of dn_ly_alpha_phot_dz

figure(2)
plot(z1,Ly_alpha_emiss)

R=0.1;

lambda=(1-Q1.*(1-R));

figure(3)
plot(z1,lambda);


figure(4)
gam=Ly_alpha_emiss.*lambda;
plot(z1,gam)



