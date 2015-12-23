%%% generate a Monte-Carlo with a Press-Schechter distribution, and
%compare to a real press-schechter 

%%% first check histogramming function
npoints=1000;
nbins=20;
y=randn(npoints,1);
x=linspace(-3,3,nbins);
dn=npoints.*6./nbins;

figure(1)
yhist=hist(y,x);
bar(x,yhist)

ytrue=1./sqrt(2.*pi).*exp(-(x.^2)./2.).*dn;
hold on
plot(x,ytrue,'red')
shg
hold off

stop

%%%% now consider Press-Schechter mass function
%%% consider distribution of objects above 10^10 M_solar at z=0
Rbox=100.; %%% in Mpc
Vbox=Rbox.^3; %%% in Mpc^3
z=0.;
nbins=20;
logMmin=10.;
Mmin=10.^logMmin;
M=logspace(logMmin,16.,nbins);
dNdlnM_real=dNdM_PS(M,0.).*M.*Vbox;

%%% now generate the Monte-Carlo realization

npoints=1000;
yi=abs(randn(npoints,1));
nu_min=delta_crit(z)./sigma_M(Mmin);
y=yi(yi>nu_min);
npoints=length(y);
Mrandom=M_from_nu(y,z,Mmin);
lgMrandom=log10(Mrandom);
logM=log10(M);
yhist=hist(lgMrandom,logM);
lgyhist=log10(yhist);

dn=npoints.*(max(logM)-min(logM))/nbins;
%figure(2)
%loglog(M,dNdlnM_real)
%shg


