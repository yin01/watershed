
%%% this is new function written 21 Aug 2007
%%% this gives the Hubble factor WITH the unit of h in
%%% and in cgs units, so it has dimensions of s^-1

function y=H_z_cgs(z)
 
factor=100.*1.e5/3.e24;

y=H_z(z).*factor;