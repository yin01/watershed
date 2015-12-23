function y=C_o_spline(z)
global pp_C_o

%if (z>6)
%y=ppval(pp_C_o,z);
%else
  z_data=[2. 3. 4. 6.];
  C_o_data=[0.558 0.599 0.611 0.880];
  y=spline(z_data,C_o_data,z);

%%%end

  if max(z)>6.
    zbig=z(z>6);
    y(z>6)=ppval(pp_C_o,zbig);
  end