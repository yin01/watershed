%%% This is the mean free path between contours of overdensity delta
%%%% given in km s^-1

function y=mfp_delta(delta,z)
  
l_o=60.; %%% Jeans length is 60 km s^-1  
y=l_o.*(f_v_down_full(delta,z).^-0.666667);
  