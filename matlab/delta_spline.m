function y=delta_spline(z)
  

  z_data=[2. 3. 4. 6.];
  delta_data=[2.54 1.89 1.53 1.09];
  y=spline(z_data,delta_data,z);
  
  if max(z)>6
    zbig=z(z>6);
    y(z>6)=7.61./(1+zbig);
  end