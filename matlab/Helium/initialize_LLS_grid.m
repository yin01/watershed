%%% this initializes the grid on which N_H_column is solved
%%% for isothermal sphere problem, simulating Lyman limit systems

global r_grid mu_grid nr_g ne_grid T_grid nmu_g
global xHI_Zheng_splinefit_g


r_ss=3.6; %% self-shielding radius 

r_min=0.2.*r_ss;
r_max=2.*r_ss;

nr_g=30;

%% initialize grid
r_grid=logspace(log10(r_min),log10(r_max),nr_g);
T_grid=ones(size(r_grid)).*2.e4;
ne_grid=nH_Zheng(r_grid).*0.82./0.76;

%% initialize Zheng spline
load -ascii xHI_Zheng.dat
r=(xHI_Zheng(:,1));
xHI=(xHI_Zheng(:,2));
xHI_Zheng_splinefit_g=spline(log(r),log(xHI)); 