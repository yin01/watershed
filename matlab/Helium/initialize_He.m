
He_parameters

%% this initializes parameters for the Helium case

addpath ~peng/Dropbox/Dropbox_Docs/reion/matlab
initialize_everything_reion

n_He_comoving=0.24*Omega_b.*rho_crit_cgs/(4.*m_p_const);

Q_g=1;  %% filling factor of He reionized regions

Delta_crit_g=10.;   %% critical density above which turn self-shielding
