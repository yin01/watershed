%%%% this is just to test the reading of the LBQS data

z_qso=6.28;

spectrum=load('qso_z_628_lo_res.txt');

lambda=10.^(spectrum(:,1));
flux=spectrum(:,2);

fit_LBQS_continuum(z_qso,lambda,flux);

%lambda_min=1270*(1+z_qso);
%lambda_max=1310*(1+z_qso);

lambda_min=7000;
lambda_max=10500;


index_lambda=find((lambda>lambda_min)&(lambda<lambda_max));
lambda1=lambda(index_lambda);
flux1=flux(index_lambda);

flux2=spline_LBQS_flux(lambda1);

plot(lambda1,flux1,lambda1,flux2,'red')
shg