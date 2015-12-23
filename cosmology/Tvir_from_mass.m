function y=Tvir_from_mass(M,z)  %%% mass is in M_solar 
cosmological_parameters

M_cgs=2.e33*M;

r_cgs=r_vir_function(M,z)*3.e24;

y=G_const*mu_const*m_p_const*M_cgs/2./r_cgs/k_b_const;