
%%% this integrates the ODE
%%% time_t is the time in Gyr
%%% y(1) is log(x_HI) 
%%% y(2) is T/1.e4

function dy= chem_func(time_t,y)
cosmological_parameters
global z_global delta_global gamma_HI_photo_g E_ion_HI_g

rho_b=Omega_b.*rho_crit_cgs.*((1+z_global).^3).*delta_global;

nH=0.76.*rho_b./m_p_const;
alpha=1.5;
  
dy=zeros(2,1);

x_HI=exp(y(1));
n_HII=(1-x_HI).*nH;
n_HI=x_HI.*nH;
ne=n_HII;
%%T=exp(y(2));
T=1.e4.*y(2);

%%%% IONIZATION FRACTIONS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

gamma_HI_photo=gamma_HI_photo_g;

gamma_HI_collide=1.17e-10.*sqrt(T).*exp(-157809./T)./(1+sqrt(T.*1.e-5));

lambda_HI=2.*157807./T;
alpha_HII=1.269e-13.*(lambda_HI.^1.503)./((1+(lambda_HI./0.522).^0.470).^1.923);
%%%alpha_HII=4.18e-13./((T.*1.e-4).^0.7);
dy(1)=-n_HI.*(gamma_HI_photo+ne.*gamma_HI_collide)+n_HII.*ne.*alpha_HII;
dy(1)=dy(1)./nH./x_HI;



%%%%%%%% Tdot %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% heat has units of erg cm^-3 s^-1

%%% photoionization heating
E_ion_HI=E_ion_HI_g;
heat1=gamma_HI_photo.*E_ion_HI.*n_HI;
heat=heat1;

%%% cooling --- also has units of erg cm^-3 s^-1
HII_recomb_cool=1.036e-16.*T.*alpha_HII.*ne.*n_HII;
HI_ion_cool=2.18e-11.*gamma_HI_collide.*ne.*n_HI;
HI_excite_cool=7.5e-19.*exp(-118348./T)./(1+sqrt(T.*1.e-5)).*ne.*n_HI;

g_ff=1.1 + 0.34.*(exp(-(5.5-log10(T)))).^2;
free_free_cool=5.54e-27.*sqrt(T).*g_ff.*n_HII.*ne;
inverse_compton_cool=5.65e-36.*(T-2.73.*(1+z_global)).*((1+z_global).^4).*ne;

cool=HII_recomb_cool+HI_ion_cool+HI_excite_cool+free_free_cool+ ...
     inverse_compton_cool;

%%%cool_func=cool/(ne.*n_HII)

cooling_time=nH.*1.38e-16.*T./(cool)./3.e7;
heating_time=nH.*1.38e-16.*T./(heat)./3.e7;

dy(2)=(2/3).*mu_const.*m_p_const./(k_b_const.*rho_b).*(heat-cool).*1.e-4;

%%%dy(2)=1./(k_b_const.*nH).*(heat-cool);

dy=dy.*3.e7.*1.e9;

cooling_time2=y(2)/dy(2).*1.e9;

