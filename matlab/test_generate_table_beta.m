%%% This is a test program which generates the table for beta=2.5, etc

z=6.245;

%%%z=6.1;

tau_line=abs(log(0.0043+2*0.0088));
flux=exp(-tau_line);
delta_exp=2.;
nline=2;
%%%%gam=gamma_from_flux2(flux,z,nline,delta_exp)

gam=0.01;
xHI=average_neutral_fraction(gam,z,2)

tau_ly_alpha=abs(log(transmitted_flux_gamma2(gam,z,1,delta_exp)))

ratio=tau_ly_alpha/tau_line