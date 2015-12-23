%%% This makes the plot of the scaling relations

z1=3.;
z2=6.;
z3=9.;

a=1./(1+z);
Hz=H_a(a).*100.*h;

delta=logspace(0.,3.);
lgdelta=log(delta);

%% logarithmic slopes

alpha1=2.2222;
alpha2=2.;
alpha3=2.;

%%% logarithmic derivative

log_deriv=1;

if log_deriv==1

r=(f_v_down_full(delta,z1)).^0.3333;
lgr=log(r);
dDelta1=diff(lgdelta)./diff(lgr);


r=(f_v_down_full(delta,z2)).^0.3333;
lgr=log(r);
dDelta2=diff(lgdelta)./diff(lgr);

r=(f_v_down_full(delta,z3)).^0.3333;
lgr=log(r);
dDelta3=diff(lgdelta)./diff(lgr);

delta_clip=delta(1:end-1);

semilogx(delta_clip,dDelta1,delta_clip,dDelta2,delta_clip,dDelta3)
axis([0.1 1.e3 -3. 10.])
shg

mat=[delta_clip' dDelta1' dDelta2' dDelta3'];

save density_slope.dat mat -ascii

end

%%% mean free path

mfp_plot=0;

if mfp_plot==1

lambda1=mfp_delta_physical(delta,z1);
lambda2=mfp_delta_physical(delta,z2);
lambda3=mfp_delta_physical(delta,z3);

lambda_analytic1=41.*(delta./100);
lambda_analytic2=33.*(delta./100);
lambda_analytic3=33.*(delta./100);


figure(1)
%loglog(delta,lambda1,delta,lambda_analytic1,delta,lambda2,delta, ...
%       lambda_analytic2) 
%loglog(delta,lambda1,delta,lambda_analytic1,delta,lambda2,delta, ...
%       lambda_analytic2,delta,lambda3,delta,lambda_analytic3) 
loglog(delta,lambda1,delta, ...
       lambda_analytic1) 
shg

figure(2)
loglog(delta,lambda2,delta, ...
       lambda_analytic2) 
shg

figure(3)
loglog(delta,lambda3,delta, ...
       lambda_analytic3) 
shg

%mat=[delta' lambda1' lambda_analytic1' lambda2' lambda_analytic2' lambda3' ...
%    lambda_analytic3'];

mat=[delta' lambda2' lambda_analytic2'];

save mfp_analytic_fits.dat mat -ascii


end


%%% recombination

rec_figure=0;

if rec_figure==1

rec2=recombination_rate_from_delta(delta,z2);
rec2_analytic=4.4.*sqrt(0.01.*delta);

figure(4)
loglog(delta,rec2,delta,rec2_analytic)
shg

mat=[delta' rec2' rec2_analytic'];

save rec_analytic_fits.dat mat -ascii

end

%%% lambda


gam2=Gamma_rad_field(rec2,lambda2,z2).*1.e12;

gam2_analytic=2.7*((0.01.*delta).^1.5);

figure(5)
loglog(delta,gam2,'red',delta,gam2_analytic,'blue')
shg

mat=[delta' gam2' gam2_analytic'];

save gam_analytic_fits.dat mat -ascii

