%%% test how the photoionization cross-section changes as a functino of
%energy

E_photon=logspace(log10(55.),log10(1000.));

sHeI=sigma_HeI(E_photon);
sHeII=sigma_HeII(E_photon);
sHI=sigma_HI(E_photon);

ratio1=sHeII./sHeI;
ratio2=12.*sHI./sHeI;


semilogx(E_photon,ratio1,E_photon,ratio2,'red')
shg