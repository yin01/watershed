%%  This is valid over the mass range 10^6 to 10^16 M_solar h^-1 to
%   better than 0.5 % for a top hat filter
function y=sigma_M(M) %% M is given in solar masses 
cosmological_parameters
  
u8=32.*gamma_CDM;  
u=3.804e-4.*gamma_CDM.*((M/Omega_m*h).^0.3333);
y=sigma8.*f_func(u)./f_func(u8);
  
  
function y=f_func(u)

y=64.087.*((1+1.074.*(u.^0.3)-1.581.*(u.^0.4)+0.954.*(u.^0.5)-0.185.* ...
	   (u.^0.6)).^(-10)); 


