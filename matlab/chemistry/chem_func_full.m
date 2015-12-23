
%%% this integrates the ODE
%%% time_t is the time in Gyr
%%% y(1) is log(x_HI) 
%%% y(2) is log(x_HeII)
%%% y(3) is log(x_HeIII)
%%% y(4) is T/1.e4


%% NOTE THAT ALL OF THE GLOBAL VARIABLES HAVE TO BE INITIALIZED IN THE
%CALLING ROUTINE


function dy= chem_func_full(t_time,y)
cosmological_parameters
global z_global delta_global gamma_HI_photo_g E_ion_HI_g gamma_HeI_photo_g E_ion_HeI_g gamma_HeII_photo_g E_ion_HeII_g

rho_b=Omega_b.*rho_crit_cgs.*((1+z_global).^3).*delta_global;

nH=0.76.*rho_b./m_p_const;
nHe=0.24.*rho_b./m_p_const./4.;
alpha=1.5;
  
dy=zeros(4,1);

x_HI=exp(y(1));
x_HeII=exp(y(2));
x_HeIII=exp(y(3));
n_HII=(1-x_HI).*nH;
n_HI=x_HI.*nH;
n_HeII=x_HeII.*nHe;
n_HeIII=x_HeIII.*nHe;
n_HeI=nHe-n_HeII-n_HeIII;
ne=n_HII+n_HeII+2.*n_HeIII;
%%%ne=n_HII;
%%T=exp(y(2));
T=1.e4.*y(4);

%%%% IONIZATION FRACTIONS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% ionization coefficients

gamma_HI_photo=gamma_HI_photo_g;
gamma_HI_collide=1.17e-10.*sqrt(T).*exp(-157809./T)./(1+sqrt(T.*1.e-5));

gamma_HeI_photo=gamma_HeI_photo_g;
gamma_HeI_collide=4.76e-11.*sqrt(T).*exp(-285335.4/T)./(1+sqrt(T.*1.e-5));

gamma_HeII_photo=gamma_HeII_photo_g;
gamma_HeII_collide=1.14e-11.*sqrt(T).*exp(-631515.0/T)./(1+sqrt(T.*1.e-5));

%%% recombination coefficients

E_eV=1.38e-16.*T./1.6e-12;

alpha_HII=alpha_HII_func(T);
alpha_HeII_r=3.925e-13.*(E_eV.^(-0.6353));
alpha_HeII_d=1.544e-9.*(E_eV.^(-1.5)).*exp(-48.596./E_eV).*(0.3+exp(8.1./ ...
						  E_eV));
alpha_HeII=alpha_HeII_r+alpha_HeII_d;
alpha_HeIII=2.*alpha_HII_func(T./4.);

%%%% equations

dy(1)=-n_HI.*(gamma_HI_photo+ne.*gamma_HI_collide)+n_HII.*ne.*alpha_HII;
dy(1)=dy(1)./nH./x_HI;

dy(2)=n_HeI.*(gamma_HeI_photo+ne.*gamma_HeI_collide)+ n_HeIII.*ne.*alpha_HeIII ...
      -n_HeII.*(gamma_HeII_photo+ ne.*gamma_HeII_collide + ne.* ...
		alpha_HeII);
dy(2)=dy(2)./nHe./x_HeII;

dy(3)=n_HeII.*(gamma_HeII_photo+ ne.*gamma_HeII_collide) - n_HeIII.*ne.*alpha_HeIII;
dy(3)=dy(3)./nHe./x_HeIII;

%%%%%%%% Tdot %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% heat has units of erg cm^-3 s^-1

%%% photoionization heating

heat1=gamma_HI_photo.*E_ion_HI_g.*n_HI;
heat2=gamma_HeI_photo.*E_ion_HeI_g.*n_HeI;
heat3=gamma_HeII_photo.*E_ion_HeII_g.*n_HeII;
heat=heat1+heat2+heat3;

%%% cooling --- also has units of erg cm^-3 s^-1
HII_recomb_cool=1.036e-16.*T.*alpha_HII.*ne.*n_HII;
HI_ion_cool=2.18e-11.*gamma_HI_collide.*ne.*n_HI;
HI_excite_cool=7.5e-19.*exp(-118348./T)./(1+sqrt(T.*1.e-5)).*ne.*n_HI;

H_cool=HII_recomb_cool+HI_ion_cool+HI_excite_cool;

HeII_recomb_cool=(1.036e-16*T*alpha_HeII_r+6.526e-11.*alpha_HeII_d).*ne.*n_HeII;
HeIII_recomb_cool=1.036e-16.*T.*alpha_HeIII.*ne.*n_HeIII;

HeI_ion_cool=3.94e-11.*gamma_HeI_collide.*ne.*n_HeI;
HeII_ion_cool=8.72e-11.*gamma_HeII_collide.*ne.*n_HeII;

HeI_excite_cool=9.1e-27.*(T.^(-0.1687)).*exp(-13179./T)./(1+sqrt(T.*1.e-5)).*ne.*n_HeI;
HeII_excite_cool=5.54e-17.*(T.^(-0.397)).*exp(-473638./T)./(1+sqrt(T.*1.e-5)).*ne.*n_HeII;

He_cool=HeII_recomb_cool+HeIII_recomb_cool+HeI_ion_cool+HeII_ion_cool+HeI_excite_cool+HeII_excite_cool;

g_ff=1.1 + 0.34.*(exp(-(5.5-log10(T)))).^2;
free_free_cool=5.54e-27.*sqrt(T).*g_ff.*n_HII.*ne;
inverse_compton_cool=5.65e-36.*(T-2.73.*(1+z_global)).*((1+z_global).^4).*ne;

cool=H_cool+He_cool+free_free_cool+ ...
     inverse_compton_cool;

tnow=time_t(z_global)+t_time.*1.e9;
znow=redshift_z(tnow);


%%%cool_func=cool/(ne.*n_HII)

cooling_time=nH.*1.38e-16.*T./(cool)./3.e7;
heating_time=nH.*1.38e-16.*T./(heat)./3.e7;

dy(4)=(2/3).*mu_const.*m_p_const./(k_b_const.*rho_b).*(heat-cool).*1.e-4;

%%%dy(2)=1./(k_b_const.*nH).*(heat-cool);

dy=dy.*3.e7.*1.e9;

%%dy(4)=dy(4)-T.*1.e-4;

cooling_time2=y(4)/dy(4).*1.e9;

