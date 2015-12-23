function [r,y] = dist_conv(radius_list, z, lower_r, upper_r);
%DIST_CONV convolve the window function of distance transform at redshift z
%with the provided radius list of bubbles and return NON-normalized
%probablity density dp/dr
%
%
%DIST_CONV(RADIUS_LIST,REDSHIFT,LOWER RADIUS BOUND, UPPER RADIUS BOUND)

points = 10000;    %speed isnt a problem for dt so we can use a fine grid
r = linspace(lower_r, upper_r, points);

y = zeros(1,points);   
[ff,u] = hist(radius_list,points);s
ff=ff/trapz(u,ff);

%loop over desired radius
for i=1:points
    current_R = u(i);   
    window = 3*(current_R - r).^2 / current_R.^3;
    
    %set zero to any r that is greater than R
    test_case = current_R - r;
    window(test_case<0) = 0;
    
    y = y + ff(i).*window.*current_R^3;
end


end