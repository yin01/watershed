%%% This is the abundance of bubbles in units of
%%% return everything in units of Mpc^-3 M_solar^-1
%%% input in units of Msolar h^-1

function y=dNdM_FHZ(M,z)
cosmological_parameters

%%%%sig=sigmaM_old_fortran(M);
sig=sigmaM_spline(M); %this take M in Msolar
B_o=B_o_func(z); %this take M in Msolar
B=B_func(M,z); %this take M in Msolar 
      
fac1=sqrt(2./pi);
fac2=B_o./(sig.^2);
fac3=exp(-0.5.*((B./sig).^2));

dNdM1=fac1.*fac2.*fac3.*abs(dSigmadM_spline(M));
rho_o = rho_m_comoving; %in units of Msolar Mpc^-3

% i dont think Omega M is necessary here
y=(rho_o./(M)).*abs(dNdM1);


