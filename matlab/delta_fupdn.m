%%%% This finds the overdensity delta 
%%% up to/below which the universe is ionized 

function y=delta_fupdn(f,z,massvol,updn)
global massvol_global zg2 fglobal

%%% initialize global variables

massvol_global=massvol;
zg2=z;

if updn==1 %%%% everything above delta is neutral	   
	   fglobal=1-f;
	   
else
  fglobal=f;
end
	 
%%%% solve for delta
lower=log(1.e-2);
upper=log(1.e5);

bounds=[lower upper];

y=exp(fzero(@delta_fup,bounds));

function y=delta_fup(lgdelta)
global massvol_global zg2 fglobal

delta=exp(lgdelta);

if massvol_global==1  %%% weighted by mass
  y=fglobal-f_M_full(delta,zg2);
else
  y=fglobal-f_v_full(delta,zg2);
end  
  