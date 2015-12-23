%%% This testing program plots all the stuff as a function of z

z=linspace(3.,6.,30);
gamma_rad=Gamma_z_fit(z);
delta=delta_from_gamma_rad(gamma_rad,z);

emissivity=global_recombination_rate(delta);


figure(1)
semilogy(z,gamma_rad)
shg

figure(2)
semilogy(z,delta)
shg

figure(3)
plot(z,emissivity)
shg