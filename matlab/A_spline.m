function y=A_spline(z)
global pp_Afit

%if (z>6)
%else
  z_data=[2. 3. 4. 6.];
  A_data=[0.406 0.558 0.711 0.864];
  y=spline(z_data,A_data,z);
%end
  if max(z)>6.
    zbig=z(z>6);
    y(z>6)=ppval(pp_Afit,zbig);
  end