

function y=eta_power_law(N_HI)
global np_g N_HI_breaks_g eta_o_g alpha_o_g

y=eta_o_g(1).*N_HI./N_HI;

for i=2:np_g
  ind=find((N_HI>=N_HI_breaks_g(i-1))&(N_HI<=N_HI_breaks_g(i)));
  y(ind)=eta_o_g(i).*((N_HI(ind)./1.5757e17).^(-alpha_o_g(i)));
end

