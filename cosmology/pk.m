%%%% fit to power spectrum 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%Eisenstein \& Hu (1997) fitting formula calculations (include baryon oscillation)%%%%%%%%%%%%
%%%%%%%Code imported from http://background.uchicago.edu/~whu/transfer/transferpage.html%%%%%%%%%%%%
% INPUT k has units of h Mpc^(-1)
% right now, this only supports mac, if intended to use in other OS, you
% need to recompile the library
function y=pk(k)

cosmological_parameters
numk = length(k);
f_baryon = Omega_b / Omega_m;
tf_full = libpointer('singlePtr',zeros(1, numk));
tf_baryon = libpointer('singlePtr',zeros(1, numk));
tf_cdm = libpointer('singlePtr',zeros(1, numk));
%loading shared library
loadlibrary('wu_transfer.dylib','wu_transfer.h');
calllib('wu_transfer','TFfit_hmpc',single(Omega_m), f_baryon, ...
    single(h), single(Tcmb), int32(numk), k, tf_full,tf_baryon,tf_cdm);

tf_full.value;

y=Ao_PS.*(k.^n_pk).*(tf_full.value).^2;  %normalized to sigma8 


  

%{
%%%%%%%% BBKS Transfer Function%%%%%%%
cosmological_parameters
q=k./(gamma_CDM);

factor1=(log(1.+2.34.*q)./(2.34.*q)).^2;
factor2=1.+3.89.*q+(16.1.*q).^2+(5.46.*q).^3+(6.71.*q).^4;
factor2=1./sqrt(factor2);

y=Ao_PS.*k.*factor1.*factor2;
%}



  
  





