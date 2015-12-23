%%% MARCH 23 2005 ---THIS IS THE PROGRAM THAT WILL FIGURE OUT THE MEAN
%FREE PATHS ONCE AND FOR ALL

%%% first, verify the claim that the limiting delta is roughly the same
%%% for a uniform radiation field and once in which it's fully ionized
%below some delta_i and fully neutral above that

z=6.;

test_limiting_delta=0;

if test_limiting_delta==1 

delta1=logspace(0.,3.,30);

rec1=recombination_rate_from_delta(delta1,z);
gam=gamma_from_recombination_rate(rec1,z);

xHI=xHI_equil(gam,delta1,z,0.);

plot(delta1,xHI)
shg

end

%%%%

test2=0;

if test2==1 

delta_i=1.;

rec=recombination_rate_from_delta(delta_i,z);
gam=gamma_from_recombination_rate(rec,z);

delta=logspace(0.,3);


rec_integrand_ion_neutral=P_delta_final(delta,z).*(delta.^3);
rec_integrand_gam=P_delta_final(delta,z).*(delta.^3).*((1-xHI_equil(gam, ...
						  delta,z,0.)).^2);

ion_frac=1-xHI_equil(gam,delta,z,0.);
ion_frac2=x_ion_from_delta_i(delta,delta_i);

figure(1)
loglog(delta,rec_integrand_ion_neutral,'blue',delta,rec_integrand_gam,'red')
shg

figure(2)
semilogx(delta,ion_frac,delta,ion_frac2)
shg

end

%%% here is the final test!

z=4.;
zfactor=(1+z)./7;
a=1./(1+z);
Hz=H_a(a).*100.*h;

%%delta_i=logspace(0,3,30);

delta_LLS=100.;

%%% first just require that it's neutral at delta_i

%%%gam1=1.4e-17.*delta_i.*(zfactor.^3);

%%% now compute the radiation field from the lyman limit systems

%%gam3=gamma_from_recombination_rate(rec,z);

%%%%delta_LLS=3.54e-2.*(delta_i.^0.66667).*(zfactor.^(-1));

%%gam1=logspace(-14,-12);

gam1=2.1e-15.*(delta_LLS.^1.5).*(zfactor.^4.5)

%%%delta_LLS=((gam1./2.1e-15).^0.666667).*(zfactor.^(-3));

rec=recombination_rate_from_delta(delta_LLS,z);

lambda_mfp=mfp_delta(delta_LLS,z)./Hz;

gam2=Gamma_rad_field(rec,lambda_mfp,z)


stop

figure(3)
%%%loglog(delta_LLS,gam1,'red',delta_LLS,gam2,'blue')

loglog(gam1,delta_LLS,'red',gam2,delta_LLS,'blue')

shg

lambda2=mfp_delta(delta_i,z);

figure(4)
loglog(delta_i,lambda2)
shg





