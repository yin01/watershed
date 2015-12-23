%%%%%% Eyeball fit to the evolution of the radiation field from Fan et al
%2002
%%%% Gamma is in 10^-12 s^-1

function y=Gamma_z_fit(z)
  
if (z<3)|(z>6)
  disp('out of range for Gamma_z_fit')
  pause
end
  
zfit=[3. 3.9 4.5 5.5 5.8 6.];
gamma_fit=[0.5 0.35 0.2 0.16 0.12 0.02];

y=spline(zfit,gamma_fit,z);