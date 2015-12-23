global z_global delta_global gamma_HI_photo_g E_ion_HI_g


%%% this little routine tests the chemistry 
%%% for hydrogen only plasma

alpha=1.5;

z=3.;
delta=50.;
gamma_HI=1.e-12;
E_ion_HI=13.6.*1.6e-12./(alpha+2);

z_global=z;
delta_global=delta; 
gamma_HI_photo_g=gamma_HI;
E_ion_HI_g=E_ion_HI;

%%%y_init2=equilibrium(z,delta,gamma_HI,E_ion_HI);

%%y_init=[log(1.e-3) log(1.e4)];

y_test=[log(1.e-4) 2.];
[time_t y_init]=ode15s(@chem_func,[0. 10.],y_test);

t1=logspace(-5,log10(3.e-3),6)';
y1=ones(6,2);
y1(:,1)=y1(:,1).*y_init(end,1);
y1(:,2)=y1(:,2).*y_init(end,2);

[t2 y2]=ode15s(@chem_func,[3.e-3 10.],[y1(end,1) y1(end,2)+3.]);

time_t=[t1; t2];
y=[y1; y2];


time_t=time_t.*1.e9;
x_HI=exp(y(:,1));
T=y(:,2).*1.e4;

figure(1)
plot(log10(time_t),log10(x_HI))

figure(2)
plot(log10(time_t),T)

