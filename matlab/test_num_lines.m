%%%%% This computes the number of lines above a certain overdensity, and 
%%%% hence above a certain column density

z=6.2;

delta=logspace(-1.,2.);
nH=1.8e-7*((1+z).^3).*delta;

N_H=1.6e21.*sqrt(nH).*0.92;

nlines=2.e4./mfp_delta(delta,z);

fV=ones(size(delta))-f_v_full(delta,z);
fM=ones(size(delta))-f_M_full(delta,z);

matrix=[delta' N_H' nlines' fV' fM'];

save num_lines.dat matrix -ascii
