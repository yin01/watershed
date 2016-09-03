%{
References
    ----------
    .. [1] Lukic et. al., ApJ, 2007,
    http://adsabs.harvard.edu/abs/2007ApJ...671.1160L   {equation (7)}
%}
function y = growth_factor(z)
dummy = zeros(1,length(z));

for i=1:length(z)
    a = 1./(1+z(i));
    cosmological_parameters

    hh0 = @(x) sqrt(Omega_m./x.^3 + (1 - Omega_m));

    logintegrand = @(lna) exp(lna) ./ ( exp(lna) .* hh0(exp(lna))).^3;

    norm = (5.0/2.0 .* Omega_m) .* hh0(1) .* integral(logintegrand, log(0.0001), log(1)); %normalize to 1 at z=0
    dummy(i) = (5.0/2.0 .* Omega_m) .* hh0(a) .* integral(logintegrand, log(0.0001), log(a)) / norm;
end
y=dummy;