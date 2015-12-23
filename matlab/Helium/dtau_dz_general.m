
%%% this is the analytic calculation that allows one to have a general 
%%% function 

function y=dtau_dz_general(z1,z2,E,N_HI_lower,N_HI_upper)
global b_g a_g

gam=1.5;
beta=1.5;
A=fN_single_power_law(1.5757e17,3.);
N_o=1.5757e17;  
z_factor=((1+z2)./4.).^gam;
 
b_g=beta-1;
a=sigma_HI(E.*(1+z2)./(1+z1)).*N_o;
a_g=0.75.*a;

x1=N_HI_lower./N_o;
x2=N_HI_upper./N_o;

integral=dtau_dz_general_func(x2)-dtau_dz_general_func(x1);

y=A.*z_factor.*N_o.*a*integral;


function y=dtau_dz_general_func(x)
global b_g a_g
  
y=-((x).^(1-b_g)).*hypergeom([1-b_g,1],2-b_g,-a_g.*x)./(b_g-1);