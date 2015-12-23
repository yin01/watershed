
%%% this tests constructing the N_H, N_HeI and N_HeII column densities
%from N_HI

N_HI=logspace(13.,20.);
gam_HI=1.e-12;
gam_HeII=1.e-14;

[N_H N_HeI N_HeII N_HeIII]=N_all_from_N_HI(N_HI,gam_HI,gam_HeII);

figure(1)
loglog(N_HI,N_H)
shg

figure(2)
loglog(N_HI,N_HeI,'blue',N_HI,N_HeII,'red',N_HI,0.08*N_H,'green')

x_HeIII=N_HeIII./(0.08*N_H);

x_HeII=N_HeII./(0.08*N_H);

x_HeI=N_HeI./(0.08.*N_H);

figure(3)
semilogx(N_HI,x_HeI,'blue',N_HI,x_HeII,'red',N_HI,x_HeIII,'cyan')
shg

x_HI=N_HI./N_H;

figure(4)
semilogx(N_HI,x_HI);
shg

