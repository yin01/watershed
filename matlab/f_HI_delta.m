%%% This gives the neutral fraction as a function of overdensity 
%%% given the radiation field gamma
%%% note that we assume the gas to be at T=2.e4

function y=f_HI_delta(delta,gamma,z)

T=2.e4;
alpha=4.2e-13.*((T./1.e4).^(-0.7));

nH=2.e-7.*((1+z).^3);

A=1.16.*nH.*alpha./(gamma.*1.e-12);

top=-1.+sqrt(1.+4.*A.*delta);
bot=1+sqrt(1+4.*A.*delta);

y=top./bot;
