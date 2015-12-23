global z_global delta_global gamma_HI_photo_g E_ion_HI_g gamma_HeI_photo_g ...
    E_ion_HeI_g gamma_HeII_photo_g E_ion_HeII_g

%%% test chemistry for full chemistry routine

alpha=1.5;
thin=alpha+2.;
middle=alpha+0.5;
thick=alpha-1.;


%%% INITALIZE GLOBAL VARIABLES

%%% things to vary
z_global=3.2;
delta_global=50.;
gamma_HI_photo_g=1.e-12;
gamma_HeII_photo_g=0.;
HeII_heat_index=thick;

%% fixed stuff
E_ion_HI_g=13.6.*1.6e-12./thin;
E_ion_HeI_g=24.6.*1.6e-12./thin;
E_ion_HeII_g=54.4.*1.6e-12./HeII_heat_index;
gamma_HeI_photo_g=gamma_HI_photo_g.*1.51./1.27.*(0.553.^(alpha))./(alpha+2);

%%%y_init2=equilibrium(z,delta,gamma_HI,E_ion_HI);

%%y_init=[log(1.e-3) log(1.e4)];

y_test=[log(1.e-3) log(0.999) log(1.e-8) 2.];
[t_time y_init]=ode15s(@chem_func_full,[0. 10.],y_test);

y=y_init;
next_step=1;

if next_step==1
  
gamma_HeII_photo_g=1.e-14;

t1=logspace(-5,log10(1.e-4),6)';
y1=ones(6,4);
y1(:,1)=y1(:,1).*y_init(end,1);
y1(:,2)=y1(:,2).*y_init(end,2);
y1(:,3)=y1(:,3).*y_init(end,3);
y1(:,4)=y1(:,4).*y_init(end,4);

[t2 y2]=ode15s(@chem_func_full,[1.e-4 10.],y1(end,:));

t_time=[t1; t2];
y=[y1; y2];

end


t_time=t_time.*1.e9;
x_HI=exp(y(:,1));
x_HeII=exp(y(:,2));
x_HeIII=exp(y(:,3));
T=y(:,4).*1.e4;

figure(1)
plot(log10(t_time),log10(x_HeII),'green',log10(t_time),log10(x_HeIII), ...
     'red')

figure(2)
plot(log10(t_time),log10(x_HI));

figure(3)
plot(log10(t_time),T)

