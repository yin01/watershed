%%%% This computes delta from NHI 
%%%% allowing for a non-uniform radiation field

function y=delta_from_NHI_full(NHI,T,gam,z,gam_beta)
global NHI_global T_global gam_global z_global gam_beta_global

npts=length(NHI);
y=zeros(size(NHI));

%%% initialize globals

for i=1:npts

NHI_global=NHI(i);
T_global=T;
gam_global=gam;
z_global=z;
gam_beta_global=gam_beta;
  
%%% solve for delta

lower=log(0.05);
upper=log(200.);

y(i)=exp(fzero(@delta_from_NHI_func,[lower upper]));
  
end

function y=delta_from_NHI_func(lgdelta)
global NHI_global T_global gam_global z_global gam_beta_global

delta=exp(lgdelta);

xHI=xHI_equil(gam_global.*1.e-12,delta,z_global,gam_beta_global).*((T_global./1.e4).^(-0.76));
NHI_model=1.3e19.*xHI*sqrt(delta).*sqrt((1+z_global)./7).*sqrt(T_global./1.e4);  
y=1.-NHI_model./NHI_global;
 
  

