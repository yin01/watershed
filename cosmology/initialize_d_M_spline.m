%%%%% this initializes the distance measures

cosmological_parameters

z=linspace(0.1,30);

lg_1z=log(1+z);
lg_d_M=log(d_M(z));

splinefit_d_M=spline(lg_1z,lg_d_M);


