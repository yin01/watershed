%%% This is the initialization program that will initialize everything
%needed in this directory

%%% clear all;
load reion_variables.mat
setup_songaila_spline
return

%%%% STOP HERE---just read in parameters


initialize_cosmology;
initialize_sigmaM_spline;
initialize_FHZ;
setup_spline_P_delta;


%% save everything---now just type 'load reion_variables.mat'  

save reion_variables.mat
