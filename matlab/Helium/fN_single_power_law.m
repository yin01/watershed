
%%% this is the single power law fit to 

function y=fN_single_power_law(N_HI,z)
  
beta=1.5;
gam=1.5;

dNdz_o=3.3;
z_factor=((1+z)./5).^gam;
N_o=1.5757e17;

y=(beta-1).*dNdz_o./N_o.*z_factor.*(N_o./N_HI).^(beta);


