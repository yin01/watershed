%%%% This shows how the mean free path and radiation field chanage with
%the emissivity at z=6


%%%delta=logspace(0.,3.);

delta=1.;
lambda=mfp_from_delta(delta);
z=6.;
a=1./(1+z);
H=H_a(a).*100.*h;
lambda_Mpc=lambda./H;
emissivity=global_recombination_rate(delta);
gamma_rad=Gamma_rad_field(emissivity,lambda_Mpc,z)

stop

figure(1)
loglog(emissivity,lambda_Mpc)
shg

figure(2)
loglog(emissivity,gamma_rad)
shg

