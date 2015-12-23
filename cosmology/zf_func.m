function y=zf_func(M)
global M_o_zf_zero

for i=1:length(M)
M_o_zf_zero=M(i);
y(i)=fzero(@zf_zero_func,[0.01,10]);
end

function y=zf_zero_func(zf)
global M_o_zf_zero
  
f=0.254;
term=2.*((sigma_M(f.*M_o_zf_zero).^2)-(sigma_M(M_o_zf_zero).^2));
y=delta_crit(zf)-delta_crit(0)-0.477.*sqrt(term);
