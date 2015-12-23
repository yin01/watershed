%%% This finds the ionization rate as a function of radius
%%%% R is in comoving Mpc

function y=reion_R(zeta,z,R)

nR=length(R);
y=zeros(size(R));

for i=1:nR

M=mass_from_R_comoving(R(i));

y(i)=zeta.*fdot_collapse(zeta,R(i),z)./3.e7;

end

y=y.*3.e7*time_t(z);