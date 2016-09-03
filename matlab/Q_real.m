%Q filling factor obtained by integrating mass function
%this can be different from zeta_global * f_coll at high z
function y = Q_real(z)
    FHZ_parameters
    dummy = zeros(1,length(z));
    m_min = zeta_global .* mass_from_Tvir(1.e4, z); %from Paranjape & Choudhury14
    for i=1:length(z)
        m_max = mass_from_R_comoving(1e3);
        integrand = @(ln_m) V_comoving_from_M(exp(ln_m)) .* dNdM_FHZ(exp(ln_m),z(i)) .* exp(ln_m) ;
        dummy(i) = integral(integrand, log(m_min(i)), log(m_max));
    end
    y=dummy;
end