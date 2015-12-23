function y=r_vir_function(M,z)  %% in Mpc
cosmological_parameters                        %% M is in M_solar 

%%%%y=0.784e-3.*((M/1.e8)^0.3333)./((1+z)./10);

  H_factor=sqrt(Omega_m.*((1.+z).^3)+Omega_lambda);
      hf=(H_factor).^2;

      rho_c_z=rho_crit_cgs.*hf;           

    
      M_cgs=M*2.e33;


      fac1=0.75.*M_cgs./(pi.*rho_c_z.*Collapse_delta(z));
      
      y=fac1.^0.3333333;
      y=y./3.e24;