%%% this is a test of the various cross sections

E=logspace(log10(54.4),log10(500));

y1=1./sigma_HeI_old(E);
y2=1./sigma_HeI(E);
y3=1./sigma_HI(E);
y4=1./sigma_HeII(E);

figure(1)
loglog(E,y1,E,y2,'black',E,y3,'*',E,y4,'red')
shg

ratio_He=sigma_HeII(E)./sigma_HeI(E);
ratio_He_H=sigma_HI(E)./sigma_HeI(E).*12;

figure(2)
plot(E,ratio_He,E,ratio_He_H)
shg

