
%%% this computes various numbers for resonance scattering of Ly-alpha in
%the IGM

z=3.;

A=1.e10;
nu=3.e10./(303.8*1.e-8);

n_He=n_He_comoving.*((1+z).^3);

beta=3.*c.*c.*(A.^2)./(32.*(pi.^3).*(nu.^2)).*n_He;

H=1./(t_H(z).*3.e7);

alpha=H.*nu./c;

nu_star=beta./alpha;

v_shift=nu_star./nu.*c

r_comoving=nu_star./alpha.*(1+z)./3.e24
