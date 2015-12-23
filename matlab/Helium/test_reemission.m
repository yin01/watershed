
global np_g N_HI_breaks_g eta_o_g alpha_o_g


%%% this gives the re-emission functions

z=3.;

gam_HI=1.e-12;
gam_HeII=1.e-14;

fit_eta_fardal_spline(gam_HI,gam_HeII);

N_HI=logspace(13,19);

eta=eta_fardal_spline(N_HI);
eta_prime=eta_fardal(N_HI,gam_HI,gam_HeII);

figure(2)
loglog(N_HI,eta,N_HI,eta_prime)
shg

alpha=gradient(log(eta),log(N_HI));

alpha_prime=gradient(alpha,log(N_HI));

figure(3)

semilogx(N_HI,alpha)

figure(4)

semilogx(N_HI,alpha_prime)


np=5;
calculate_eta_power_law(np);
eta_approx=eta_power_law(N_HI)

figure(5)
loglog(N_HI,eta,N_HI,eta_approx)
shg