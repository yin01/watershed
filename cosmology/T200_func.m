%%%% This is the virial temperature when overdensity is 200 times
%critical density
%%% input m200 in M_solar h^-1
%%% output in keV

function y=T200_func(m200);
cosmological_parameters
  
r=r200_func(m200);  %%% this is output in kpc h^-1

y=G_const.*(m200.*2.e33./h.*mu_const.*m_p_const)./(2.*r.*3e21./h);

y=y./1.6e-9;  %% convert to keV
