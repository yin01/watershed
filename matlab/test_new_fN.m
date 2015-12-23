%%% This tests the new fN distribution

T=2.e4;
gam=1.;
deltaz=1.;
z=2.8;

%NHI=logspace(12.,18);
%delta=delta_from_NHI(NHI,T,gam,z);

%Nlines=Nlines_cum(delta,deltaz,z);


%loglog(NHI,Nlines)
%shg

delta=logspace(-1,3);

dOmega_b_dlogdelta=2.*Omega_b.*(delta.^2).*P_delta_final(delta,z);

figure(1)
loglog(delta,dOmega_b_dlogdelta)
axis([0.1 1000. 1.e-3 1.])
shg

%%%%%----------------------
%%% make sure z=3 is right
%%%------------------------

NHI=logspace(12,18);
fN=fN_Schaye(NHI,z,gam,T);
fN2=5.3e7.*(NHI.^(-1.46));
fN3=fN2_dummy(NHI,z,gam,T);


figure(1)
loglog(NHI,fN,NHI,fN2,NHI,fN3,'*')
shg


