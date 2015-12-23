%%%% Here is the ratio of the fluxes

tau_a=linspace(0.,30.);
tau_b=tau_a/6.;

absorb_a=exp(-tau_a);
absorb_b=exp(-tau_b).*0.1;

ratio_fluxes=absorb_a./absorb_b;

semilogy(tau_a,ratio_fluxes)