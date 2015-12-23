
%%% this solves for x_HI as a function of radius

function y=xHI_solver(gam_ion,ne,T)
global gam_ion_g ne_g T_g
  
npts=length(gam_ion);

for i=1:npts
gam_ion_g=gam_ion(i);
ne_g=ne(i);
T_g=T(i);
y(i)=exp(fzero(@xHI_solver_func,log(1.e-6),log(1.)));
end
    
function y=xHI_solver_func(lgx)
global gam_ion_g ne_g T_g
  
  
x_HI=exp(lgx);

y=x_HI.*gam_ion_g-((1-x_HI).^2).*ne_g.*1.41e-13.*((T_g./2.e4).^(-0.7));