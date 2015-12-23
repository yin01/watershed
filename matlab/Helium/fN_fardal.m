
%%% this uses the A1 model of Fardal et al (1998) to generate the fN(HI)
%distribution


function y=fN_fardal(N_HI,z)

A=ones(size(N_HI));
beta=ones(size(N_HI));
gam=ones(size(N_HI));

    A(N_HI<1.e14)=1.45e-1;
    beta(N_HI<1.e14)=1.4;
    gam(N_HI<1.e14)=2.58; 
    
 
    A(N_HI>=1.e14 & N_HI <1.e16)=6.04e-3;
    beta(N_HI>=1.e14 & N_HI <1.e16)=1.86;
    gam(N_HI>=1.e14 & N_HI <1.e16)=2.58;
  
    A(N_HI>=1.e16 & N_HI <1.e19)=2.58e-2;
    beta(N_HI>=1.e16 & N_HI <1.e19)=1.23;
    gam(N_HI>=1.e16 & N_HI <1.e19)=2.58;

    A(N_HI>=1.e19 & N_HI <1.e22)=8.42e-2;
    beta(N_HI>=1.e19 & N_HI <1.e22)=1.16;
    gam(N_HI>=1.e19 & N_HI <1.e22)=1.30;
  
N_r=1.e17;

y=(A./N_r).*((N_HI./N_r).^(-beta)).*((1+z).^gam);


  
  
  
  