
%%% this tests how well the tau approximations are working

z1=3.;
z2=logspace(log10(4.),log10(6.));
z2=z2-0.95;

E1=15.;
E2=35;
E3=50.;

calculate=1;

if calculate==1

t1_exact=tau_eff_HI_exact(z1,z2,E1);
t2_exact=tau_eff_HI_exact(z1,z2,E2);
t3_exact=tau_eff_HI_exact(z1,z2,E3);

t1_analytic=tau_HI_analytic(z1,z2,E1);
t2_analytic=tau_HI_analytic(z1,z2,E2);
t3_analytic=tau_HI_analytic(z1,z2,E3);

t1_approx=tau_eff_HI_approx(z1,z2,E1);
t2_approx=tau_eff_HI_approx(z1,z2,E2);
t3_approx=tau_eff_HI_approx(z1,z2,E3);

end

figure(1)
plot(z2,t1_exact,'red',z2,t1_analytic,'blue',z2,t1_approx,'green')

figure(2)
plot(z2,t2_exact,'red',z2,t2_analytic,'blue',z2,t2_approx,'green')

figure(3)
plot(z2,t3_exact,'red',z2,t3_analytic,'blue',z2,t3_approx,'green')


err1=1-t1_analytic./t1_exact;
err2=1-t2_analytic./t2_exact;
err3=1-t3_analytic./t3_exact;

figure(4)
plot(z2,err1,'red',z2,err2,'blue',z2,err3,'green')