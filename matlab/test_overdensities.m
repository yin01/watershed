
z=linspace(3,6.1,10);


load -ascii delta_crit_alpha_isothermal.dat 
load -ascii delta_crit_beta_isothermal.dat

load -ascii delta_crit_alpha_tilt06.dat 
load -ascii delta_crit_beta_tilt06.dat

alpha_iso=reshape(delta_crit_alpha_isothermal,3,10);
beta_iso=reshape(delta_crit_beta_isothermal,3,10);
alpha_tilt06=reshape(delta_crit_alpha_tilt06,3,10);
beta_tilt06=reshape(delta_crit_beta_tilt06,3,10);

med_delta_a=alpha_iso(1,:);
upper_delta_a=alpha_iso(2,:);
lower_delta_a=alpha_iso(3,:);
med_delta_b=beta_iso(1,:);
upper_delta_b=beta_iso(2,:);
lower_delta_b=beta_iso(3,:);

med_tilt06_a=alpha_tilt06(1,:);
med_tilt06_b=beta_tilt06(1,:);

figure(1)

plot(z,med_delta_a,'r',z,upper_delta_a,'r--',z,lower_delta_a,'r--',z,med_delta_b,'b',z,upper_delta_b,'b:',z,lower_delta_b,'b:')

figure(2)

ratio=med_delta_b./med_delta_a;
ratio2=med_tilt06_b./med_tilt06_a;

plot(z,ratio,z,ratio2)
