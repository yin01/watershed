%%%  Spline fit to derivative

function y=dSigmadM_spline(M)
cosmological_parameters

lgM=log(M);
sig=sigmaM_spline(M);
dlogsigmadM=ppval(lgM,splinefit_dsigmadM);

y=sig./M.*dlogsigmadM;