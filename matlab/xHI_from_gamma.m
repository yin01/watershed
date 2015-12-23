%%%% This gives the neutral fraction from the strength of the radiation
%field
%%% massvol=0 volume weighted
%%% massvol=1 mass weighted

function y=xHI_from_gamma(gam,z,massvol,gam_beta)
global gam_global delta_global z_global massvol_global beta_global

massvol_global=massvol;
beta_global=gam_beta;

nz=length(z);
y=zeros(size(z));

for i=1:nz  
gam_global=gam(i);
z_global=z(i);

lower=log(1.e-2);
upper=log(1.e2);  %%% don't push this to higher delta---it's totally unreliable
 
y(i)=quadl(@xHI_from_gam_func,lower,upper,1.e-8);

end
  
function y=xHI_from_gam_func(lgdelta)
global gam_global delta_global z_global massvol_global beta_global
  
  
delta=exp(lgdelta);

factor=delta.^(massvol_global);

y=xHI_equil(gam_global,delta,z_global,beta_global).*P_delta_final(delta,z_global).*delta;

y=y.*factor;