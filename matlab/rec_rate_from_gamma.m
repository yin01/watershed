%%% This gives the global recombination rate in ## of recombinations per
%%%% Hubble time for a given UNIFORM radiation field
%%% gamma is given in PHYSICAL units (s^-1, so put in factors of 1.e-12
%yourself)

function y=rec_rate_from_gamma(gam,z)
global gam_RRG z_RRG

ngam=length(gam);

z_RRG=z;

lower=log(1.e-2);
upper=log(1.e4);

%%% do integral

for i=1:ngam
  gam_RRG=gam(i);
  y(i)=quadl(@rec_rate_FG_func,lower,upper);
end

n=2.e-7.*((1+z).^3);
t_rec=1./(4.e-13*n)./3.e7;
R_u=t_H(z)./t_rec; %%% ratio of recombination rate to Hubble constant 
y=y.*R_u;


function y=rec_rate_FG_func(lgdelta)
global gam_RRG z_RRG

delta=exp(lgdelta);
y=P_delta_final(delta,z_RRG).*(delta.^3).*((1-xHI_equil(gam_RRG,delta,z_RRG,0.)).^2);


