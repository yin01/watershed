function y=growth_factor(z)
cosmological_parameters

      if (abs(Omega_m-1.)>=1.e-2) 
         y=growth_supp(Omega_z(z))./growth_supp(Omega_m) ...
          ./(1.+z);
      else
         y=1./(1.+z);
      end


function y=growth_supp(Omega)
cosmological_parameters
  
      if (abs(Omega_m-1.)<=1.e-2) %% SCDM
         growth_supp=1.;
      end

      if (abs(Omega_k)<=1.e-2) %% flat lambda CDM
         denom=1./70.+209./140.*Omega-(Omega.^2)/140.+Omega.^(4./7.);
      else
         denom=1.*0.5.*Omega+Omega.^(4./7.);
      end

      y=2.5.*Omega./denom;
