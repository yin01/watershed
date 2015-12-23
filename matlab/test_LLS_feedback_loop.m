
%% this tests how the mean free path and ionizing radiation gamma depend
% on the redshift and the emissivity of the ionizing radiation


%%lower_emiss=rec_rate_from_gamma(1.e-14,z)./(t_H(z)./1.e9);
%%upper_emiss=rec_rate_from_gamma(1.e-12,z)./(t_H(z)./1.e9);

%%%emiss=logspace(log10(lower_emiss),log10(upper_emiss),20);
%%%emiss=linspace(lower_emiss,upper_emiss,20);

emiss=3;    %%%rec_rate_from_gamma(1.e-14,6);
z=linspace(4,12,30);

delta=delta_from_emissivity(emiss,z);
mfp3=zeros(size(z));

R=zeros(size(z));

for i=1:length(z)
  mfp(i)=mfp_delta_physical(delta(i),z(i));
  R(i)=recombination_rate_from_delta(delta(i),z(i))./(t_H(z(i))/1.e9);
end

%%%power_law_index=gradient(log(mfp),log(emiss));
power_law_index=gradient(log(mfp),log(1+z));

%figure(1)
%plot(z,power_law_index2)
%shg

plot(z,mfp);
%%plot(z,mfp,z,mpf2)
shg


