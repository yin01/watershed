%%% This finds the ionizing background gamma from the 
%%% VOLUME-WEIGHTED neutral fraction
%%% this version allows one to change the equation of state


function y=gamma_from_neutral_fraction(xHI,z)
global xHI_global zg nline_g delta_exp_g

%%% initialize globals

nz=length(z);
y=zeros(size(z));

for i=1:nz

flux_global=flux(i);
zg=z(i);
nline_g=nline;
delta_exp_g=delta_exp;

%%%%

guess=log(0.1);

y(i)=exp(fzero(@gamma_from_flux_func,guess));
  
end


function y=gamma_from_flux_func(lggamma)
global xHI_global zg nline_g delta_exp_g
  
gamma=exp(lggamma);


y=f_v_full(delta,zg)-xHI_global;