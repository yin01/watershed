

%%% this gives the foreground absorption in Ly-alpha, given the
%Lyman-beta redshift

function y=tau_alpha_fg(zb)

za=z_fg_alpha_zb(zb);

%% equation 5 of fan et al (2006)

%%%y=0.85.*((1+za)./5).^(4.3);

%% equation in Songaila & Cowie (2002), equation (19)

y=3.5+8.1.*log((1+za)./7);