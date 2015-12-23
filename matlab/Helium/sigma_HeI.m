
%% E is in eV

function ans=sigma_HeI(E)

E_o=1.361e1;
sigma_o=9.492e-16;
P=3.188;
y_a=1.469;
y_w=2.039;
y_o=0.4434;
y_1=2.136;

x=E./E_o-y_o;
y=sqrt(x.^2+y_1.^2);

A=(x-1).^2+y_w.^2;

B=(y.^(0.5.*P-5.5))./(1+sqrt(y/y_a)).^P;

ans=sigma_o.*A.*B;

ans(E<24.4)=0.;

