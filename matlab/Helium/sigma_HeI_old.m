
%% E is in eV

function y=sigma_HeI_old(E)

E_100=E./100;

y=0.694e-18./(E_100.^1.82+E_100.^3.23);

