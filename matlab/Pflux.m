%%% This is the power spectrum of flux transmission
%%% k is in units of (Mpc h^-1)^-1


function y=Pflux(k)

B=0.033;
a=0.013; %%% this is in Mpc^2 h^-2

nk=length(k);
y=zeros(size(k));

for i=1:nk

lower=log(k(i));
upper=log(30.);

integral=quadl(@Pflux_int,lower,upper);

y(i)=B.*exp(-a.*(k(i).^2)).*integral;

end

function y=Pflux_int(lgk)

k=exp(lgk);  
y=pk(k).*k.*k./(2.*pi);
