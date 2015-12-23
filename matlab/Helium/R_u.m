
%%% this is the recombination rate per Helium atom in gas at the mean
%density
%%% in units of dQ/dz
%%% note: this is NOT multiplied by Q_i (the fraction of ionized He),
%that is necessary only to include their contribution to the electron fraction

function y=R_u(z,Q_i)
cosmological_parameters

%% assuming that Helium is singly ionized

n_b=Omega_b.*rho_crit_cgs./m_p_const;

ne=0.76*n_b+ 0.24/4.*(1+min(1.,Q_i)).*n_b;

ne=ne.*((1+z).^3.);


%%% some arbitrary factor of 0.5 

y=2.18e-12.*3.e7.*ne./dzdt(z).*0.5;

%%%y=2.18e-12.*3.e7.*ne.*0.73;





