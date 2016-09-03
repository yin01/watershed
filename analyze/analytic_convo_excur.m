function [r,y] = analytic_convo_excur(z14, upper_R)
%ANALYTIC_CONV_excur convolve the window function of mfp at 
%redshift z with the excursion set bubble distribution and return a 
%NON-normalized probability density dp/dr. This one runs slower than all
%other convolution functions since we have to compute the window function
%for each step. Perhaps optimizating true_analytic.m can speed up
%the process
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

m_min=mass_from_Tvir(1.e4, z14);
lower_R = R_comoving_from_M(zeta_global*m_min);    %1e4 virial temperature

points = 1000;    
R = linspace(lower_R, upper_R, points);

y = zeros(1,points);

masses = mass_from_R_comoving(R);
%10.^9 factor to make some entries non zeros since they are small
%Essentially, 10.^9 is the volume of the space
enlarge_factor = 10.^9;
%dNdR = enlarge_factor*dNdM_FHZ(masses,z14) .* r.^2;

dNdR = dNdR_FHZ_eul(masses,z14);
r = linspace(0.1,upper_R*2,points);
%loop over given radius and add up the contribution
for count = 1:points
    current_R = R(count)

    analytic_exp = zeros(1,points);          
    for i=1:points
        analytic_exp(i) = true_analytic(r(i), current_R);        
    end
    %now fix the problems of NaN
    analytic_exp(analytic_exp<0) = 0;
    %analytic_exp = fixgaps(analytic_exp);
    analytic_exp(isnan(analytic_exp)) = 0;
    
    %now integrate
    y = y + dNdR(count).*analytic_exp.*current_R^3;
end

end