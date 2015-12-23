%%%% This is the total number of lines above delta in a redshift interval
%delta z
%%% At redshift z 

function y=Nlines_cum(delta,deltaz,z)
  
delta_t=1./(dzdt(z)).*deltaz;
v_delta_z=abs(3.e5.*(delta_t./t_H(z)));    %%% this is the velocity change in
                                      %km s^-1 due
                                      %to Hubble expansion in a redshift
                                      %interval deltaz=1
v_mfp=mfp_delta(delta,z);
				      
y=v_delta_z./v_mfp;
				      