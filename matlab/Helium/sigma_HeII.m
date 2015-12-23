
%% E is in eV

function ans=sigma_HeII(E)

E_o=1.720;
sigma_o=1.369e-14;
P=2.963;
y_a=32.88;
y_w=0.;
y_o=0.;
y_1=0.;

x=E./E_o-y_o;
y=sqrt(x.^2+y_1.^2);

A=(x-1).^2+y_w.^2;

B=(y.^(0.5.*P-5.5))./(1+sqrt(y/y_a)).^P;

ans=sigma_o.*A.*B;

ans(E<54.4)=0.;

