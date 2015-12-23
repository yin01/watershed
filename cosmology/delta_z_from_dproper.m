%%% This gives the redshift separation from the proper distance in Mpc

function y=delta_z_from_dproper(dproper,z)
cosmological_parameters

a=1./(1+z);
v=h.*100.*H_a(a).*dproper; %%% velocity in km s^-1
y=(v.*1.e5./c).*(1+z);

