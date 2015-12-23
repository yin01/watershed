
%%% this gives the mean transmitted flux computed from the becker PDF

function y=F_mean_becker(z)
global z_g_F

nz=length(z);
y=zeros(size(z));

for i=1:nz
z_g_F=z;
y=quadl(@F_mean_becker_int,log(1.e-3),log(0.999));  
end


function y=F_mean_becker_int(lgF)
global z_g_F

F=exp(lgF);
y=P_F_lognormal(F,z_g_F).*F.*F;
