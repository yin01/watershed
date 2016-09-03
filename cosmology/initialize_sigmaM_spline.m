%%%% This initializes the spline for sigmaM and dsigmadM
%%% M is in units of M_solar, NOT M_solar h^-1


cosmological_parameters

mass=logspace(5,20);
lgMh=log(mass);
lgsigmaM=log(sigmaM_full(mass));

splinefit_sigmaM=spline(lgMh,lgsigmaM);
splinefit_dsigmadM=fnder(splinefit_sigmaM);

