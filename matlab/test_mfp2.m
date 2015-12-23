z=3.;
zfactor=(1+z)./7;
a=1./(1+z);
Hz=H_a(a).*100.*h;

gam1=0.3e-12;

delta_LLS=((gam1./2.1e-15).^0.666667).*(zfactor.^(-3))

delta_i=150.*(delta_LLS.^1.5).*(zfactor.^1.5)

lambda_mfp=mfp_delta(delta_LLS,z)./Hz/sqrt(pi)

rec=rec_rate_from_gamma(gam1,z)

rec2=recombination_rate_from_delta(delta_LLS,z)

gam2=Gamma_rad_field(rec2,lambda_mfp,z)

