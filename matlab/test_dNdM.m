%%% test the bubble size and Press-Schechter type stuff

initialize_cosmology;
initialize_sigmaM_spline
initialize_FHZ;
%%%%initialize_sigmaM_spline;


m=Mass_from_r_M(8./h);
s1=sigmaM_spline(m)
s2=sigmaM_full(m)
s3=sigmaM_old_fortran(m)
s4=sigma_M(m)

mass=logspace(8.,16.);
sig1=sigmaM_old_fortran(mass);
%%%%sig1=sigmaM_full(mass);  %%%sigma_M(mass);
sig2=sigmaM_spline(mass);

diff_sig=(sig1-sig2)./sig2;

%%%loglog(mass,sig1,mass,sig2)
%figure(1)
%semilogx(mass,diff_sig)
%shg

dsig1=dSigmadM(mass);
dsig2=dSigmadM_spline(mass);

diff_dsig=(dsig1-dsig2)./dsig1;

%figure(2)
%semilogx(mass,diff_dsig)
R = linspace(0.1,15.4,10000);
mass= mass_from_R_comoving(R);

%dNdM1=dNdM_PS(mass,10.);
%dNdM2=dNdM_FHZ(mass,10.);

%figure(3)
%loglog(mass,dNdM1,mass,dNdM2)
%stop


z1=12;
f1=V_comoving_from_M(mass).*mass.*dNdM_FHZ(mass,z1);


z2=14.;
f2=V_comoving_from_M(mass).*mass.*dNdM_FHZ(mass,z2).*3./Q_filling_factor(z2);
z3=18.;
f3=V_comoving_from_M(mass).*mass.*dNdM_FHZ(mass,z3).*3./Q_filling_factor(z3);
z4=16.;
f4=V_comoving_from_M(mass).*mass.*dNdM_FHZ(mass,z4).*3./Q_filling_factor(z4);
z5=13.;
f5=V_comoving_from_M(mass).*mass.*dNdM_FHZ(mass,z5).*3./Q_filling_factor(z5);
z6=14.45;
f6=V_comoving_from_M(mass).*mass.*dNdM_FHZ(mass,z6).*3./Q_filling_factor(z6);
R=R_comoving_from_M(mass);
z7 = 15.22;
f7=V_comoving_from_M(mass).*mass.*dNdM_FHZ(mass,z7).*3./Q_filling_factor(z7);
R=R_comoving_from_M(mass);
z8 = 13.63;

f8=V_comoving_from_M(mass).*mass.*dNdM_FHZ(mass,z8).*3./Q_filling_factor(z8);
figure(3)
%semilogx(R,f1)
semilogx(R,f2)
%semilogx(R,f2,R,f3,R,f4,R,f5,R,f6)
xlabel('$R$(Mpc)','Interpreter','LaTex','FontSize',20);
ylabel('$\propto V\frac{dn}{d\ln R}$','Interpreter','LaTex','FontSize',20);

axis([10^(-1) 100 0 inf]);
shg

%%% OK now test growth of filling factor

z=linspace(10,20);
Q=Q_filling_factor(z);

%figure(4)
%plot(z,Q)
%shg