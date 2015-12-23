%%% Given the strength of the radiation field, this tells you what gamma
%%% the medium is ionized up to

%%% gamma is in (in 10^-12 s^-1)

function y=delta_from_gamma_rad(gamma_rad,z)
global GR_global z_global

nz=length(z);

y=zeros(size(z));

for i=1:nz

GR_global=gamma_rad(i);
z_global=z(i);


guess=log(1.);

y(i)=exp(fzero(@delta_from_GR_func,guess));
  
end

function y=delta_from_GR_func(lgdelta)
global GR_global z_global 
  
  
delta=exp(lgdelta);
y=Gamma_rad_from_delta(delta,z_global)-GR_global;