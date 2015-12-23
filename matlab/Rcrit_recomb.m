%%% THIS VERSION 


%%% This is the critical size of a recombination-limited bubble
%%%% for a given ionizing efficiency zeta
%%% and redshift z

function y=Rcrit_recomb_with_fdot_spline(zeta,z)
global z_g2 zeta_g2

%%% loop over redshift OR zeta

nz=length(z);
nzeta=length(zeta);

np=max(nz,nzeta);

for i=1:np

%%% initialize global variables

z_g2=z(i);
zeta_g2=zeta;

%%% search for radius

lower=log(1.);
upper=log(100.);

y(i)=exp(fzero(@Rcrit_recomb_func,[lower upper]));

end
  
function y=Rcrit_recomb_func(lgR)
global z_g2 zeta_g2

R=exp(lgR);
M=mass_from_R_comoving(R);


delta_filter=delta_x(M,z_g2)./(1+z_g2);
delta_real=delta_from_mfp(R,z_g2);
ne=2.e-7*((1+z_g2).^3);
recomb=1.16.*4.e-13.*ne.*(1+delta_filter).*clumping_factor(delta_real,z_g2);


ionize=zeta_g2.*fdot_collapse(zeta_g2,R,z_g2)./3.e7;

y=(recomb-ionize)./recomb;



