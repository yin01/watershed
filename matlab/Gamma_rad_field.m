%%%%% The ionizing background (in PHYSICAL UNITS  s^-1) from
%%% emiss (in photons per atom per Hubble time)
%%% lambda_mfp (in Mpc proper)
%%% from above equation 5. of Miralda-Escude 2003

function y=Gamma_rad_field(emiss,lambda_mfp,z)
cosmological_parameters

emiss_cgs=emiss.*2.e-7.*((1+z).^3)./(t_H(z).*3.e7);  % in cm^-3 s^-1
lambda_cgs=lambda_mfp.*3.e24;

spectral_index=1.5;
sigma_o=6.3e-18;  %%% ionization cross-section at Lyman edge

y=(emiss_cgs.*spectral_index).*lambda_cgs.*sigma_o./(1.+spectral_index);


%%%y=y.*1.e12;
%%%y=y.*3.46;