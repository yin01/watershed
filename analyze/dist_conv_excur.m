function [r,y] = dist_conv_excur(z14,upper_R)
%DIST_CONV convolve the window function of distance transform at redshift z
%with the excursion set size distribution and return a NON-normalized
%probability density dp/dr
%
%
%DIST_CONV_EXCUR(REDSHIFT,LOWER RADIUS BOUND, UPPER RADIUS BOUND)

%initialize excursion set paramters
addpath('../')
addpath('../cosmology');
addpath('../matlab');
initialize_cosmology;
initialize_sigmaM_spline;
initialize_FHZ;

points = 1000;  
m_min=mass_from_Tvir(1.e4, z14);
lower_R = R_comoving_from_M(zeta_global*m_min);    %1e4 virial temperature
R = linspace(lower_R, upper_R, points);

masses = mass_from_R_comoving(R);
dNdR = dNdR_FHZ_eul(masses,z14);
r = linspace(0.1,upper_R,points);

y = zeros(1,points);
%{
%10.^9 factor to make some entries non zeros since they are small
%Essentially, 10.^9 is the volume of the space
enlarge_factor = 10.^9;
dNdR = enlarge_factor*dNdM_FHZ(masses,z14) .* r.^2;  
%}


for i=1:points
    current_R = r(i);

    window = 3.*(current_R - r).^2 / current_R.^3;
    
    %set zero to any r that is greater than R
    test_case = current_R - r;
    window(test_case<0) = 0;
    
    %now integrate
    y = y + dNdR(i)*window.*current_R^3;
end

zeta_global
end