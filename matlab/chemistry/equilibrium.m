
function y=equilibrium(z,delta,gamma_HI,E_ion_HI)
global z_global delta_global gamma_HI_photo_g E_ion_HI_g

z_global=z;
delta_global=delta; 
gamma_HI_photo_g=gamma_HI;
E_ion_HI_g=E_ion_HI;

return
y=fminsearch(@equil_func,[log(1.e-4) 1.]);

%%y(1)=exp(y(1));

function tot=equil_func(y);

df=chem_func(1.,y);

tot=sum(df.*df);

