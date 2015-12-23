%%%% fit to power spectrum 

function y=pk(k)
cosmological_parameters  
  
q=k./(gamma_CDM);

factor1=(log(1.+2.34.*q)./(2.34.*q)).^2;
factor2=1.+3.89.*q+(16.1.*q).^2+(5.46.*q).^3+(6.71.*q).^4;
factor2=1./sqrt(factor2);

y=Ao_PS.*k.*factor1.*factor2;
  
  
  





