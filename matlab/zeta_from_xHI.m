%%% This gives the value of zeta from xHI


function y=zeta_from_x_ion(x_ion,z)

Q=x_ion;

y=Q./f_collapse(z);
