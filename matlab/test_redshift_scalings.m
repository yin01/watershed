%%%% This stuff tests the redshift scalings of the mean free path, the
%%% radiation field, and the recombination rate

delta=100.;

z=linspace(6.1,9.);

lgzfactor=log(1+z);

nz=length(z);
lgy=zeros(size(z));

for i=1:nz

gam=mfp_delta_physical(delta,z(i))*recombination_rate_from_delta(delta,z(i));
lgy(i)=log(gam);

end

dydz=diff(lgy)./diff(lgzfactor);

zfactor_clip=z(1:end-1);

plot(zfactor_clip,dydz)
shg