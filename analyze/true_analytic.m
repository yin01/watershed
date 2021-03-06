function val = true_analytic(r, R)
%TRUE_ANALYTIC calculates the normalized probability desntiy as presented
%in the appendix of Lin et al. 2016
%Sometimes it returns NaN or complex value of some unknown reason. Need to
%use fixgaps.m to amend for that
%
%
%TRUE_ANALYTIC(LENGTH, RADIUS)

t = linspace(abs(R-r), R, 1000);

rho = (1/(2*R.^5)).*((0.5.* 1./r) .* (2.*r.^2.*R.^2 - r.^4 - R.^4 - ...
    t.^4 + 2.*R.^2.*t.^2 + 2.*r.^2.*t.^2).^(1/2)) .* ((3.*t.*R.^2) ./ ...
    (r - sqrt(R.^2 - ((0.5.* 1./r) .* (2.*r.^2.*R.^2 - r.^4 - R.^4 - ... 
    t.^4 + 2.*R.^2.*t.^2 + 2.*r.^2*t.^2).^(1/2)).^2))) .* (-((R.^2 - ... 
    r.^2 + t.^2)./((2.*r.^2.*R.^2 - r.^4 - R.^4 - t.^4 + 2.*R.^2*t.^2 + ...
    2.*r.^2.*t.^2).^(1/2))) + (0.5.* 1./r.^2) .* (2.*r.^2.*R.^2 - ...
    r.^4 - R.^4 - t.^4 + 2.*R^2.*t.^2 + ...
    2.*r.^2.*t.^2).^(1/2));
if sum(isnan(rho)) > 0
   rho(1) = rho(2);
end
pp = trapz(t,rho);
val = pp;
end