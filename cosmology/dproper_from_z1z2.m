
%% written Dec 29, 2008
%%% given an start redshift z1 and end redshift z2, this gives the proper
%(physical) distance between the two points
%% output is in Mpc (physical)

function y=dproper_fromz1z2(z1,z2)

y=abs(quadl(@dproper_fromz1z2_func,z1,z2));
  
function y=dproper_fromz1z2_func(z)
cosmological_parameters

v=1./(1+z).*c./1.e5;
a=1./(1+z);
y=v./(100.*h.*H_a(a));
  
