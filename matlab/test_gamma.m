%%% test spline fit to gamma

z=linspace(3,6.1);
gamma_rad=Gamma_z_fit(z);

zfit=[3. 3.9 4.5 5.5 5.8 6.];
gamma_fit=[0.5 0.35 0.2 0.16 0.12 0.02];


semilogy(z,gamma_rad,zfit,gamma_fit,'*')
%%%semilogy(z,gamma_rad)
axis([3. 6.2 0.01 1])
shg