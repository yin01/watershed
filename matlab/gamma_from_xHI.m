%%% Get ionizing background from volume-weighted neutral fraction xHI
%%% massvol=0 volume-weighted
%%% massvol=1 mass-weighted

%%% beta is index of gamma power law Gamma=gam_o delta^beta
%%% beta=0 is uniform radiation field

function y=gamma_from_xHI(xHI,z,massvol,gam_beta)
global xHI_global z_global massvol_global beta_global

%%% Initialize global variables

xHI_global=xHI;
z_global=z;
massvol_global=massvol;
beta_global=gam_beta;

lower=log(1.e-18);
upper=log(1.e-10);

lims=[lower upper];

y=exp(fzero(@gamma_from_xHI_func,lims));

function y=gamma_from_xHI_func(lggamma)
global xHI_global z_global massvol_global beta_global
  
gam=exp(lggamma);  
y=xHI_from_gamma(gam,z_global,massvol_global,beta_global)-xHI_global;  