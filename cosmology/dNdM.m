%%%% This is the Press-Schechter mass function
%%% return everything in units of Mpc^-3 M_solar^-1
%%% input in units of Msolar


function y=dNdM(M,z)
cosmological_parameters

sig=sigmaM_old_fortran(M);
delta_c=delta_crit(z);
      
fac1=sqrt(2./pi);
fac2=delta_c./(sig.^2);
fac3=exp(-0.5.*((delta_c./sig).^2));

dNdM1=fac1*fac2*fac3*abs(dSigmadM(M));
rho_o=2.684e11*h*h; 
y=Omega_m.*(rho_o./(M))*dNdM1;
