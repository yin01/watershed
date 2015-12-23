%%% P_delta as given in equation 6 of Miralda-Escude et al 2000

function y=P_delta(delta)
cosmological_parameters

%%% these fit parameters are for z=6

A=0.864;
delta_o=1.09;
beta=2.50;
C_o=0.880;

%%% these fit parameters are for z=2

%A=0.406;
%delta_o=2.54;
%beta=2.23;
%C_o=0.558;

factor=A.*(delta.^(-beta));
exponent=(((delta.^-0.66667)-C_o).^2)./(2.*((2.*delta_o./3.).^2));

y=factor.*exp(-exponent)./log(10.); %%% factor of log(10.) was found from
                                    %my previous GP work to be necessary
                                    %to obtain mass & volume normalized
                                    %to 1. Don't include if comparing w/ Fig1.

