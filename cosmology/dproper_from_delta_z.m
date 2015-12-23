%%%% This gives the proper distance in Mpc 
%%% from delta z and z
%%% This is of course only valid for small delta z

function y=dproper_from_delta_z(delta_z,z)
cosmological_parameters

%%v=delta_z./(1+z).*c./1.e5; %%% velocity separation in km s^-1
a=1./(1+z);

y=c.*1.e-5./(100.*h.*H_a(a)).*delta_z./(1+z)

