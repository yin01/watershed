%%% this tests out the fN power law scaling that will be put in the
%Appendix of Furlanetto & Oh (2005)

z1=3.;
z2=6.;
z3=9.;

a1=1./(1+z1);
a2=1./(1+z2);
a3=1./(1+z3);

NHI=1.e13;

NH_LLS=1.6e17;

%%%%gam1=Gamma_Bullock_fit(z1);
%%%gam1=1.;

gam1=1.;
gam2=1.;
gam3=1.;

T=2.e4;
gam_beta=0.;

fN1=fN_Schaye_full(NHI,z1,gam1,T,gam_beta)
fN2=fN_Schaye_full(NHI,z2,gam1,T,gam_beta)
fN3=fN_Schaye_full(NHI,z3,gam1,T,gam_beta)

%%%%Hu_fN=5.3e7*(NHI.^(-1.46))

NHI_power1=1.56;
NHI_power2=1.6667;
NHI_power3=1.6667;


Hfactor1=H_a(a1).*(a1.^2);
Hfactor2=H_a(a2).*(a2.^2);
Hfactor3=H_a(a3).*(a3.^2);

dNdz1=fN_Schaye_full(NH_LLS,z1,gam1,T,gam_beta)./Hfactor1.*NH_LLS./(1- ...
						  NHI_power1);
dNdz2=fN_Schaye_full(NH_LLS,z2,gam2,T,gam_beta)./Hfactor2.*NH_LLS./(1- ...
						  NHI_power2);
dNdz3=fN_Schaye_full(NH_LLS,z3,gam3,T,gam_beta)./Hfactor3.*NH_LLS./(1- ...
						  NHI_power3);


mfp1=3.e10.*t_H(z1).*3.e7./3.e24./(1+z1)./dNdz1
mfp2=3.e10.*t_H(z2).*3.e7./3.e24./(1+z2)./dNdz2
mfp3=3.e10.*t_H(z3).*3.e7./3.e24./(1+z3)./dNdz3


