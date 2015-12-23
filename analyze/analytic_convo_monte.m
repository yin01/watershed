function [r,y] = analytic_convo_monte(z14, lower_r, upper_r, radius_list)
%ANALYTIC_CONV_MONTE convolve the window function of mfp at 
%redshift z with the given bubble radius list(presumably generated from 
%adaptive_montecarlo.m) and return a NON-normalized
%probability density dp/dr 
%
%
%DIST_CONV_EXCUR(REDSHIFT,LOWER RADIUS BOUND, UPPER RADIUS BOUND, bubble 
%                list)

points = 1000;
r = linspace(lower_r, upper_r, points);

y = zeros(1,points);
[ff,u] = hist(radius_list,points);
ff=ff/trapz(u,ff);
z14
%loop over given radius and add up the contribution
for count = 1:points
    current_R = u(count)

    analytic_exp = zeros(1,points);          
    for i=1:points
        analytic_exp(i) = true_analytic(r(i), current_R);        
    end
    %now fix the problems of NaN
    analytic_exp(analytic_exp<0) = 0;
    analytic_exp = fixgaps(analytic_exp);
    analytic_exp(isnan(analytic_exp)) = 0;
    
    %now integrate
    y = y + ff(count).*analytic_exp.*current_R^3;
      
end
end