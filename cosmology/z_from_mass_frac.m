function y=z_from_mass_frac(frac,M_o)
global f M_o_test

f=frac;
M_o_test=M_o;

y=fzero(@z_frmass_zero,[0. 10.]);
  

function y=z_frmass_zero(z)
global f M_o_test
  
y=mass_frac(M_o_test,z)-f;