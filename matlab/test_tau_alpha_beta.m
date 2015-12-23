%%% This is the test program which checks the ratio of tau_alpha to
%tau_beta

initialize_cosmology;

%%% reproduce Fig. 7 of White et al
bubble_size=linspace(1.e-2,2.5);
zgal=6.08;
z1=6.0;
deltaz=delta_z_from_dproper(bubble_size,zgal);
z2=zgal-deltaz;

xHI=1.;
%%%bubble_size=dproper_from_delta_z(deltaz,zgal);
taured=tau_Ly_alpha(zgal,z1,z2,xHI);

z1=zgal+deltaz;
z2=6.32;
taublue=tau_Ly_alpha(zgal,z1,z2,xHI);
tau=taured+taublue;

bubble_diameter=2.*bubble_size;
figure(1)
semilogy(bubble_diameter,tau)
axis([0. 2.5 1. 30.])
shg

