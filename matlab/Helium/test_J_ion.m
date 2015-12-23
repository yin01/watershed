

%%% this tests the ionizing background between 1 and 4 Ry

z=3.2;

[E_vec,J_vec]=fit_J_nu_spline(z);

semilogy(E_vec,J_vec)
ylim([1.e-24 1.e-20])