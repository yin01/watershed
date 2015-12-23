%% correction factor to convert SFR to Lambda CDM cosmology

function y=SFR_correction(z)
cosmological_parameters

fac1=sqrt(Omega_m.*((1+z).^3)+Omega_k.*((1+z).^2)+Omega_lambda);
fac2=1./((1+z).^1.5);

y=fac1.*fac2.*(h/0.65);

%%y=y.*1.67; % convert to lower mass cutoff of 0.1 M_solar instead of 0.5 M_solar
