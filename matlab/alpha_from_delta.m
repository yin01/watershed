%%% This finds the slope of the density profile from the slope of the
%column density distribution function

function y=alpha_from_delta(delta)

beta=1.5.*delta;

y=3./(beta-1);
