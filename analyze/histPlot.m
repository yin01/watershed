%Histogram plot of excursion set (and given bubble radius list, pixelList,
%if uncommented out)
%
%
%Three things need to change: z14(redshift), startPoint, endPoint

%initialize excursion set parameters
addpath('../cosmology');
addpath('../matlab');
initialize_cosmology;
initialize_sigmaM_spline;
initialize_FHZ;

z14 = 11.4; %z14 = 12.5, 11.4, 10.35 for REAL COSMOLOGY z = 12, 11, 10


figure(1),hold on;

%{
%plot given bubble distribution (pixelList) to compare with excursion set
[y,x] = hist(log(pixelList),20);

vol = (4./3) .*pi.*exp(x(:)).^3;
%norm = trapz(x(:),vol(:).*y(:));
y = y(:) .* vol(:);
y = y./trapz(x,y);
plot(exp(x),y);
%}
startPoint = 0.2;
endPoint = 150;
R14 = linspace(startPoint,endPoint,1000000);
mass14= mass_from_R_comoving(R14);
f14=V_comoving_from_M(mass14).*mass14.*dNdM_FHZ(mass14,z14).*3./Q_filling_factor(z14);

ionizedFrac_excur = trapz(R14,f14./R14)
dNdR = dNdM_FHZ(mass14,z14) .* (R14.*R14);
normdNdR = trapz(R14,dNdR);
dNdR = dNdR ./ normdNdR;

f14 = f14 ./ ionizedFrac_excur;
plot(R14,f14,'k-');

