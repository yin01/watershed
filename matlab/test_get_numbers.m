%%% This is to get numbers for the paper

z1=3.;
z2=6.;
z3=9.;

zfactor1=(1+z1)./7;
zfactor2=(1+z2)./7;
zfactor3=(1+z3)./7;

delta=100.;

mfp1=mfp_delta_physical(delta,z1)
mfp2=mfp_delta_physical(delta,z2)
mfp3=mfp_delta_physical(delta,z3)

rec1=recombination_rate_from_delta(delta,z1)
rec2=recombination_rate_from_delta(delta,z2)
rec3=recombination_rate_from_delta(delta,z3)

gam1=Gamma_rad_field(rec1,mfp1,z1)
gam2=Gamma_rad_field(rec2,mfp2,z2)
gam3=Gamma_rad_field(rec3,mfp3,z3)

xH1=xHI_equil(gam1,delta,z1,0.)
xH2=xHI_equil(gam2,delta,z2,0.)
xH3=xHI_equil(gam3,delta,z3,0.)

delta_LLS1=130.*(zfactor1^(-3))
delta_LLS2=130.*(zfactor2^(-3))
delta_LLS3=130.*(zfactor3^(-3))

delta_i1=((gam1*1.e12)^-0.66667)*100.
delta_i2=((gam2*1.e12)^-0.66667)*100.
delta_i3=((gam3*1.e12)^-0.66667)*100.

