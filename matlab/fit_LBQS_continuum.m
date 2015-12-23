%%%% this constructs a spline fit to the LBQS spectra
%%% lambda and flux are the input vectors from reading the spectrum 
%%% normalization is from region 4 Angstroms wide around 1280

function fit_LBQS_continuum(z_qso,lambda,flux)
global LBQS_spline lambda_LBQS flux_LBQS

LBQS_data=load('LBQS_spectra.dat');

lambda_LBQS=LBQS_data(:,1).*(1+z_qso);
flux_LBQS=LBQS_data(:,2);

%%% average over 4 rest frame angstroms in real data
lambda_norm=1290*(1+z_qso);
lambda1=lambda_norm-(2.*(1+z_qso));
lambda2=lambda_norm+(2.*(1+z_qso));

index_lambda=find((lambda>lambda1)&(lambda<lambda2));
flux_norm=mean(flux(index_lambda));

%%% now average over 4 angstroms in LBQS data
index_LBQS=find((lambda_LBQS>lambda1)&(lambda_LBQS<lambda2));
flux_LBQS_norm=mean(flux_LBQS(index_LBQS));

factor=flux_norm/flux_LBQS_norm;

renorm=lambda_LBQS/lambda_norm;

flux_LBQS=factor.*flux_LBQS./renorm;

LBQS_spline=spline(lambda_LBQS,flux_LBQS);

