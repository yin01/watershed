
%%% this is the spline fit to songaila (2004)

function y=tau_a_song_spline(z)
global pp_song_alpha
  
if ((min(z) < 2.4) | max(z) > 6.12) 
display('out of range in spline')
return
end

y=exp(fnval(pp_song_alpha,log(1+z)));

