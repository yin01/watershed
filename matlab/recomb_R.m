%%% This finds the recombination rate as a function of radius
%%% R is in Mpc comoving
%%% output is in s^-1

function y=recomb_R(zeta,z,R)
 
  
nR=length(R); 
y=zeros(size(R));
  
for i=1:nR
M=mass_from_R_comoving(R(i));  
delta_filter=delta_x(M,z)./(1+z);
delta_real=delta_from_mfp(R(i),z);
ne=2.e-7*((1+z).^3);
y(i)=1.16.*4.e-13.*ne.*(1+delta_filter).*clumping_factor(delta_real,z);
end

y=y.*3.e7*time_t(z);