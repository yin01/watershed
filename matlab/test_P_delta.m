%%% test the density distribution function of Miralda-Escude et al

initialize_cosmology;

delta=logspace(-2,3);

Fv=1.-F_v(delta);
Fm=1.-F_m(delta);

Ru=1.18;
Grr=global_recombination_rate(delta)./Ru;

%Fv=P_delta(delta).*delta;
%Fm=P_delta(delta).*(delta.^2);

figure(1)
semilogx(delta,Fv,delta,Fm);
shg

figure(2)
loglog(delta,Grr);
axis([1.e-2 1.e3 1.e-2 100.]);
shg

delta=logspace(0.,3.);
lambda=mfp_from_delta(delta);

figure(3)
loglog(delta,lambda)
shg