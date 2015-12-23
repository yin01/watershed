

function y=fN_test(lgN_HI)
  
N_HI=exp(lgN_HI);
z=4.;

y=N_HI.*fN_single_power_law(N_HI,z);
