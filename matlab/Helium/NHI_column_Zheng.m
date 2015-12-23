
%%% this gives the column density NHI (in cm^2) as a function of the impact
%parameter b (in kpc)

function y=NHI_column_Zheng(b)
global b_g
  
xmin=log(1.e-3);

r_vir=11.1;

if (max(b)> r_vir)
  printf('maximum b is too large')
  pause
else
  
  nb=length(b);
  y=zeros(size(b));
  
  for i=1:nb
    b_g=b(i);
    xmax=log(sqrt(r_vir.^2 - b_g.^2));
    y(i)=quadl(@NHI_Zheng_func,xmin,xmax);
  end
end

y=2.*y.*3.e21; %%% convert to cm^-2, also take care of symmetry
  
  
function y=NHI_Zheng_func(lgx)
global b_g

x=exp(lgx);

r=sqrt(b_g.^2+x.^2);

y=n_HI_Zheng(r).*x;


 
  
  
  
  
  
  
