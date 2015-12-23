
%% this is the mfp in PROPER MPC between He LLS

function y=mfp_He_LLS(z)
  
ratio_He_H_mfp=0.06;

factor_z=((1+z)./4).^-4;

y=6.2.*factor_z.*(ratio_He_H_mfp./0.06);


