

%% Written 26 Oct 2008
%%% Given the radiation field gamma, the EoS Delta_exp, this gives the
%temperature as a function of the transmitted flux

function y=temperature_from_flux(flux,z,gam,nline,delta_exp)
 
A=gamma_from_flux2(flux,z,nline,delta_exp)./gam;

y=(A.^(1./0.7)).*1.e4;

