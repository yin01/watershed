function y=time_t(z)
cosmological_parameters

Hubble_time=1e10/h;  % 1/H_o in years

      if (abs(Omega_m-1)<=1e-2) % SCDM
         y=2./3.*Hubble_time/((1+z).^1.5);
      end

      if (abs(Omega_k)<=1e-2) % flat lambda CDM
         factor=2./3.*Hubble_time./sqrt(1.-Omega_m);
         arg=((1.+z).^(-1.5)).*sqrt((1.-Omega_m)./Omega_m);
         y=factor.*asinh(arg);
      end