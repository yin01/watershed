%%%% This is a testbed for all the FHZ stuff

initialize_cosmology;

z1=12;
z2=16;
z3=20;
M=logspace(9.,18.);
sigMsq=sigma_M(M).^2;

delta_x1=B_func(M,z1);
delta_x2=B_func(M,z2);
delta_x3=B_func(M,z3);

plot(sigMsq,delta_x1,sigMsq,delta_x2,sigMsq,delta_x3)
axis([0. 30. 0. 17.])
shg