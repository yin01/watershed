%%%% This is the Ly-alpha damping wing optical depth
%%% for hydrogen extending from z1 to z2, when observed at a wavelength 
%%%% lambda_alpha (1+z)
%%% xHI is the neutral fraction in the region from z1 to z2

%% require z<z1<z2 or z1<z2<z


function y=tau_Ly_alpha(z,z1,z2,xHI)
cosmological_parameters

tau_GP=3.42e5.*(((1+z)./7.08).^1.5);  %%% This assumes the high redshift
                                      %approximation for H(z) and
                                      %concordance cosmology
				      
prefactor=6.43e-9.*tau_GP.*xHI;

I1=I_GP((1+z2)./(1+z));
I2=I_GP((1+z1)./(1+z));
y=abs(prefactor.*(I2-I1));





