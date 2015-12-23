%%% This computes the fN distribution by allowing the radiation field to
%have a density dependence----more general version
%%%% gamma=gamma_o*(delta^beta_gam)
%%% uniform radiation field corresponds to beta_gam=0

%%% This is also the correct version which didn't rely on the
%approximations in the Schaye paper

%%% gamma is given in units of 1.e-12

%%% 5 March 2005: modified to allow for vecor NHI

function y=fN_Schaye_full(NHI,z,gam,T,gam_beta)
cosmological_parameters
 
H_o=100.*h.*1.e5./3.e24;
Y=0.24;
numerical_factor=3.*H_o.*c.*(1-Y)./(8.*pi.*G_const.*m_p_const);


%nvec=length(NHI_vec);
%y=zeros(size(NHI_vec));

%for i=1:nvec
  
%NHI=NHI_vec(i);

delta=delta_from_NHI(NHI,T,gam,z);
x_HI=xHI_equil(gam*1.e-12,delta,z,gam_beta).*((T./1.e4).^(-0.76));

%%% calculate derivative 
NHI_factor=(NHI./2.7e13);
Tfactor=T./1.e4;
zfactor=(1+z)./4;
delta_exp=1./(1.5-gam_beta);
ddelta_dNHI=delta_exp.*(NHI_factor.^(delta_exp-1.)).*(Tfactor.^(0.26*delta_exp)).* ...
      (gam.^delta_exp).*(zfactor.^(-4.5*delta_exp))./2.7e13;

%%% put it all together

y=numerical_factor.*Omega_b.*delta.*P_delta_final(delta,z).* ...
     ddelta_dNHI.*x_HI./NHI;



%end