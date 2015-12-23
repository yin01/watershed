%%% This gives the PROPER length in Mpc
%%% from the redshift interval (z1,z2)

function y=length_from_deltaz(z1,z2)
  
t1=time_t(z1);
t2=time_t(z2);

deltat=abs(t1-t2).*3.e7;

y=3.e10*deltat/3.e24;