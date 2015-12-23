%%%% This is a spline fit to beta for Jordi's stuff
%%% if z>6, then assume isothermal profile

function y=beta_spline(z)

%if (z>6) 
%  y=2.50;
%else
  
z_data=[2. 3. 4. 6.];
beta_data=[2.23 2.35 2.48 2.50];
y=spline(z_data,beta_data,z);

y(z>6)=2.5;

%end