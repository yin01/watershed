%%% cross-correlation of overdensities in 2 spheres with radii r1 and r2
%%%% r1 and r2 are COMOVING radii in Mpc


function y=xi_r1r2(r1,r2)
cosmological_parameters
global r1_global r2_global

r1_global=r1*h;  %%% convert to units of Mpc h^-1
r2_global=r2*h;  %%% convert to units of Mpc h^-1

lower=log(1.e-3);
upper=log(1.e5);

y=quadl(@xi_r1r2_func,lower,upper);

function y=xi_r1r2_func(lgk)
cosmological_parameters
global r1_global r2_global

k=exp(lgk);
x1=r1_global*k;
x2=r2_global*k;
window1=((3./(x1.^3)).*(sin(x1)-x1.*cos(x1)));
window2=((3./(x2.^3)).*(sin(x2)-x2.*cos(x2)));
y=window1.*window2.*pk(k).*k.*k.*k./(2.*pi.*pi);  