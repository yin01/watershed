
%%% this tests the radiative transfer within the isothermal sphere

%%% first initialize optically thin profile

initialize_LLS_grid;

gam_ion=1.5e-12.*ones(size(r_grid));

x_HI=xHI_solver(gam_ion,ne_grid,T_grid);

x_HI_Zheng=xHI_Zheng_spline(r_grid);

figure(1)
loglog(r_grid,x_HI,r_grid,x_HI_Zheng)
shg


%%% now calculate N_H grid

