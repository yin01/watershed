%%%% This gives the ionized fraction from the limiting delta_i 
%%% at which x_ion=0.5

function y=x_ion_from_delta_i(delta,delta_i)
  

y=delta_i./(4.*delta).*(sqrt(1+8.*delta./delta_i)-1.);