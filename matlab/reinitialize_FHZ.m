%%% this reinitializes FHZ to a given value of zeta

function reinitialize_FHZ(zeta)
FHZ_parameters

zeta_global=zeta;
K_global=erfinv(1-1/zeta_global);

