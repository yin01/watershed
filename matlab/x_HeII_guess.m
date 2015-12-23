
%% this gives some stupid guess for what the He_reionization fraction as
%a function of overdensity

function y=x_HeII_guess(delta)
global Q_g Delta_crit_g

y=Q_g;

%% self-shielding above the critial threshold
y(delta>=Delta_crit_g)=1.;

