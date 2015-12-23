%%% This gives the flux in the wavelength range from lambda_min to
%lambda_max
%%% given the z_qso
%%% lambda and flux are the input from reading the spectra
%%% The unattenuated flux is normalized to a region 4 Angstroms wide (rest frame) 
%%% around 1290
%%%% Derived from the Telfer et al continuum


function y=telfer1_continuum(z_qso,lambda,flux,lambda_min,lambda_max)
  
alpha=1.57; %%% for radio-quiet
%%%%%alpha=1.96 %%% for radio-loud

lambda_norm=1290*(1+z_qso);

lambda1=lambda_norm-(2.*(1+z_qso));
lambda2=lambda_norm+(2.*(1+z_qso));

index_lambda=find((lambda>lambda1)&(lambda<lambda2));
flux_norm=mean(flux(index_lambda));

%%% first calculate the flux at 1280 Angstroms
lambda_norm2=1280.*(1+z_qso);
x1=lambda_min/lambda_norm2;
x2=lambda_max/lambda_norm2;

index=alpha-1;
delta_x=(x1-x2);

modulation=(1290/1280).^(alpha-2);
factor=((x1^index)-(x2^index))/index/delta_x*modulation;

%%%factor=x1^(alpha-2);



y=abs(flux_norm*factor);


%factor=xmean^index;

%y=abs(flux_norm*factor);