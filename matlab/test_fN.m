%%% Test the fN distribution

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

%NHI=logspace(12,18);
%fN=fN_Schaye(NHI,z,gam,T);
%fN2=5.3e7.*(NHI.^(-1.46));


%figure(2)
%loglog(NHI,fN,NHI,fN2)
%shg


%matrix=[NHI' fN' fN2'];
%save fN_z3.dat matrix -ascii

%%% 
z=6.2;
%%%%gam1=5.e-3;
gam1=1.1e-2;
gam2=9.5e-4;
gam3=3.9e-5;
T=2.e4;

NHI=logspace(16.,22.);

fN1=fN_Schaye_full(NHI,z,gam1,T);
fN2=fN_Schaye_full(NHI,z,gam2,T);
fN3=fN_Schaye_full(NHI,z,gam3,T);

figure(3)
loglog(NHI,fN1,NHI,fN2,NHI,fN3)
shg



matrix=[NHI' fN1' fN2' fN3'];
save fN_z62_uniform.dat matrix -ascii

