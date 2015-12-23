
%%% written 11/30/08
%%% this tests how the ratio tau_alpha/tau_beta depends on alpha
%%% and also how the temperature

alpha=linspace(-1,1,10);
beta=2.-0.7.*alpha;

z=[4 5 6];
tau_ratio1=zeros(3,length(beta));
T_ratio=zeros(3,length(beta));

for j=1:3

z1=z(j);
tau_a1=tau_a_song_spline(z1);
flux_a1=exp(-tau_a1);
A_alpha1=gamma_from_flux2(flux_a1,z1,1,2); 


nalpha=length(beta);
tau_b1=zeros(size(beta));
A_beta1=zeros(size(beta));

for i=1:nalpha
  delta_e=beta(i)
  gam=gamma_from_flux2(flux_a1,z1,1,delta_e);
  flux_b1=transmitted_flux_gamma2(gam,z1,2,delta_e);
  tau_b1(i)=-log(flux_b1);
  A_beta1(i)=gamma_from_flux2(flux_b1,z1,2,2);
end

tau_ratio1(j,:)=tau_a1./tau_b1;
T_ratio1(j,:)=(A_alpha1./A_beta1).^(1./0.7);

end

figure(1)
plot(alpha,tau_ratio1(1,:),alpha,tau_ratio1(2,:),alpha,tau_ratio1(3,:))

figure(2)
plot(alpha,T_ratio1,alpha,T_ratio1(2,:),alpha,T_ratio1(3,:))
  

