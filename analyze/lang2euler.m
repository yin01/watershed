%{
Eulerian bubble size distribution of FHZ04
Source: Paranjape & Choudhury 2014
http://adsabs.harvard.edu/abs/2014MNRAS.442.1470P
%}

function y=dNdR_FHZ_eul(M,z)
%initialize excursion set parameters
addpath('../cosmology');
addpath('../matlab');
initialize_cosmology;
initialize_sigmaM_spline;
initialize_FHZ;

redshift_input = z;
%{
m_min=mass_from_Tvir(1.e4, redshift_input);
R_min = R_comoving_from_M(zeta_global*m_min);
R_max = 100;
R_lag = logspace(log10(R_min),log10(R_max),1000);  %Lagrangian radius
m_input = mass_from_R_comoving(R_lag);
%}

m_input = M;
R_lag = R_comoving_from_M(M);


%true barrier from equation (4) of FZH 04  
%delta_x = @(m,z) delta_crit(z) - sqrt(2).*K_global.*sqrt(sigmaM_spline(m_min).^2 - sigmaM_spline(m).^2);


myfun = @(m,z,theta) 3 .* 6.^(2./3) ./ (20 .*growth_factor(z).* B_func(m,z)).*(theta - sin(theta)).^(2/3) - 1./(1+z);
theta = [];
%BHII = [];
for i = 1:length(m_input)
     theta = [theta, fzero(@(x) myfun(m_input(i),redshift_input,x),[1e-6 4.5])];
end
R_eul = (3./10) .* 20./(3.*6.^(2/3)) .* (1-cos(theta))./(theta - sin(theta)).^(2/3) .* R_lag;    %comoving Eulerian radius
VV0 = (R_eul./R_lag).^3;   %both in comoving coordiante with units Mpc

dlnS0dlnR0 = abs(6.*m_input.*dSigmadM_spline(m_input)./sigmaM_spline(m_input));
%dlnBdlnS0 = 1/sqrt(2) ./ sqrt(sigmaM_spline(m_min).^2 - sigmaM_spline(m_input).^2) ./ delta_x(m_input,redshift_input);
sigMminsq=(sigmaM_spline(m_min).^2);
B1=K_global./sqrt(2.*(sigMminsq));
dlnBdlnS0 = B1 .* sigmaM_spline(m_input).^2 ./ B_func(m_input,redshift_input);
angles = 1 - ((3/2) .* theta .* (theta - sin(theta))./(1-cos(theta)).^2);
dlnRdlnR0 = 1 - (dlnS0dlnR0 .* dlnBdlnS0 .* angles);

%calculuate excursion set and Q filling factor
VdNdlnR = VV0 .* V_comoving_from_M(m_input) .* m_input .*dNdM_FHZ(m_input,redshift_input) .* 3 ./ dlnRdlnR0;
%VdNdlnR = VV0 .* V_comoving_from_M(m_input) .* m_input .*dNdM_FHZ(m_input,redshift_input) .* 3 ;
Q = trapz(log(R_eul),VdNdlnR);
%y = VdNdlnR ./ Q;
y = m_input .*dNdM_FHZ(m_input,redshift_input) .* 3 ./ (dlnRdlnR0 .* R_eul);

