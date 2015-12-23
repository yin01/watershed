function y=dzdt(z)  % in units of yr^-1
cosmological_parameters

Hubble_time=1.e10/h; 

    t=time_t(z);

    if (abs(Omega_m-1.)<=1e-2) % SCDM
         factor=(2./3.*Hubble_time).^0.666667;
         y=factor*(-2./3./(t.^(5./3.)));
    end
    
    if (abs(Omega_k)<=1e-2) % flat lambda CDM
         A=sqrt(Omega_m/(1.-Omega_m));
         B=1.5*(1./Hubble_time).*sqrt(1.-Omega_m);
         y=(A.^(2./3.)).*(-2./3.).*B.*((sinh(B.*t)).^(-5./3.)).* ...
	      cosh(B.*t);
    end