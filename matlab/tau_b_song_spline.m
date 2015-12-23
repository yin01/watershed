
%%% spline fit to songaila (2004)

function y=tau_b_song_spline(z)
global pp_song_beta
  
if ((min(z) < 3.1) | max(z) > 6.1) 
display('out of range in spline')
return
end

y=exp(fnval(pp_song_beta,log(1+z)));
