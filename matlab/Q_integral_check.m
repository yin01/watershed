%%%% Total FHZ volume filling factor 
%%% Found by integrating over the dNdM mass function

function y=Q_integral_check(z)
cosmological_parameters
global z_Qglobal

nz=length(z);
y=zeros(size(z));

for i=1:nz
z_Qglobal=z(i);

lower=log(1.e8.*(((1+z(i))/10.).^(-1.5)));
upper=log(1.e20);

y(i)=quadl(@Q_int_func,lower,upper);
  
y(i)=min(y(i),1.);
end

  
function y=Q_int_func(lgm)
cosmological_parameters
global z_Qglobal
  
M=exp(lgm);
V=V_comoving_from_M(M);
dNdM=dNdM_FHZ(M,z_Qglobal);
y=dNdM.*V.*(M);

