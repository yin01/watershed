z=2.8;
Y=0.24;
eta=1.5;
%%%gam=0.53*1.e-12;
%%%gam=gam_He(z);
gam=1.e-14;

%%%lambda=110.*(((1+z)./5).^(-3))*3.e24/(1+z)*0.05
%%%lambda=mfp_He_LLS(z).*3.e24;
lambda=100./(1+z).*3.e24;
%% sigma_o=6.3e-18;
sigma_o=1.91e-18;
n_o_H=Omega_b.*rho_crit_cgs.*(1-0.75*Y)/m_p_const.*((1+z).^3);
n_o=Omega_b.*rho_crit_cgs.*(Y)/(4*m_p_const).*((1+z).^3);
t=time_t(z).*3.e7;

num_phot=sqrt(pi)*(eta+1.5)*gam.*t/(eta*lambda*sigma_o*n_o)