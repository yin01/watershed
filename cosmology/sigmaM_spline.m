%%%% THis is the spline fit to sigma M
%%% input M in M_solar h^-1

function y=sigmaM_spline(M)
cosmological_parameters

lgM=log(M);
y=exp(ppval(lgM,splinefit_sigmaM));


  