%%% This generates the full fN distribution

beta_gam=0.;

z=6.2;
%%%%gam1=5.e-3;
gam1=1.147e-2;
gam2=1.1e-3;
gam3=5.65e-5;
T=2.e4;

NHI=logspace(16.,22.);

fN1=fN_Schaye_full(NHI,z,gam1,T,beta_gam);
fN2=fN_Schaye_full(NHI,z,gam2,T,beta_gam);
fN3=fN_Schaye_full(NHI,z,gam3,T,beta_gam);

figure(3)
loglog(NHI,fN1,NHI,fN2,NHI,fN3)
shg



matrix=[NHI' fN1' fN2' fN3'];
save fN_z62_beta1.dat matrix -ascii

