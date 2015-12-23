%%% this is a test of the transmitted flux in He

He_parameters

E=54.6;
lambda=0.01;
z=3.;

delta_i=15;
Q=0.5;

n_He=n_He_comoving.*((1+z).^3);

lambda_mfp=1./(n_He.*sigma_He_ionization(E))./3.e24;

tau1=-log(P_transmit_He(E,lambda,z,Q,delta_i))
tau2=f_M_full(delta_i,z).*(1-Q).*(lambda./lambda_mfp)

%plot(lambda,tau1,lambda,tau2)
%shg