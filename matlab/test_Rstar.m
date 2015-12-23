%%% This tests the algorithm where find the characteristic bubble size

%%% consider 3 cases where reionization ends at different redshifts

zend1=6.;
zend2=8.;
zend3=14.;

%%%% initialize zetas

zeta1=zeta_from_x_ion(1.,zend1);
reinitialize_FHZ(zeta1);

z1=linspace(6.,12.,10.);

Q=Q_filling_factor(z);

Rstar=Rstar_FHZ(z);
Rcrit=Rcrit_recomb(zeta1,z);

figure(1)
semilogy(z1,Rstar,'red',z1,Rcrit,'blue')
shg



