%%%% This tests the comparison of lines between the fN approach and the
%%% dndNdz approach

%%% Let's compare the number of lines above NHI=1.e14 at z=3 with both
%%% approaches, in a redshift interval delta z=1

T=1.e4;
gam=0.00001;
deltaz=0.5;
z=6.2;
a=1./(1+z);

NHI_limit=6.2e13/2.7e-6;
delta_limit=delta_from_NHI(NHI_limit,T,gam,z)


deltaz_conversion=((1+z).^2)./H_a(a)*deltaz;


%%%nlines_integral=5.3e7/0.46*(NHI_limit.^(-0.46))*deltaz_conversion
nlines_integral=fN_Schaye(NHI_limit,z,gam,T)*NHI_limit/0.46*deltaz_conversion
nlines_jordi=Nlines_cum(delta_limit,deltaz,z)

nlines_ratio=nlines_integral/nlines_jordi