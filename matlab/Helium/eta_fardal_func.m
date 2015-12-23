
function y=eta_fardal_func(lg_eta)
global N_HI_g Gam_HI_g Gam_HeII_g
 
eta=exp(lg_eta);

N_HeII=eta.*N_HI_g;

tau_HI=N_HI_g.*sigma_HI(13.6);

tau_HeII=N_HeII.*sigma_HeII(54.4);

%% this is the tricky part: map n onto N_HI. use the Schaye argument,
%% equation A4 of McQuinn et al 

%%%n=6.e-4.*(((N_HI_g./1.e16).*(Gam_HI_g./1.e-12)).^0.666667);

%%% this is the relation in fardal eta al 
%%n=2.e-3.*sqrt(N_HI_g./1.e17);

n=4.e-3;

%% this is the bit where account for self-shielding of hydrogen 

%N_HI_trans=1.6e17;
%ntrans=6.e-4.*(((N_HI_trans./1.e16).*(Gam_HI_g./1.e-12)).^0.666667);
%%n(N_HI_g>=N_HI_trans)=ntrans.*((N_HI_g./N_HI_trans).^2);

%% case A recombination coefficients, assuming T=20,000 K 
alpha_HI=2.51e-13;
alpha_HeII=1.36e-12;
alpha_B_HeII=9.08e-13;

I_HI=Gam_HI_g./(alpha_HI.*n);
I_HeII=Gam_HeII_g./(alpha_HeII.*n);

n_He_frac=0.0789;

y=0.25*n_He_frac.*tau_HI./(1+0.5.*tau_HI).*I_HI - tau_HeII - I_HeII.* ...
  tau_HeII./(1.+0.7.*tau_HeII);  