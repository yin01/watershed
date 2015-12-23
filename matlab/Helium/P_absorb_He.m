
%%% Probability that a He ionizing photon of energy E (in eV) is absorbed over
%%% some distance lambda (in PHYSICAL Mpc)

function y=P_absorb_He(E,lambda,z,Q,Delta_i)
global Eg zg lambda_g Q_g_P

Eg=E;
zg=z;
lambda_g=lambda; 
Q_g_P=Q;


nl=length(lambda);
nE=length(E);
lower=log(1.e-2);
upper=log(Delta_i);

if nl>=2

  for i=1:nl
    lambda_g=lambda(i); 
    y(i)=1.-quadl(@P_absorb_He_int,lower,upper,1.e-8);
  end
else
    for i=1:nE
      Eg=E(i);
      y(i)=1.-quadl(@P_absorb_He_int,lower,upper,1.e-8);
    end
end
 
function y=P_absorb_He_int(lgdelta)
He_parameters
global Eg zg lambda_g Q_g_P
  
delta=exp(lgdelta);

n_He=n_He_comoving.*((1+zg).^3);

%%tau=x_HeII_guess(delta).*n_He.*delta*sigma_He_ionization(Eg).*(lambda_g.*3.e24);

tau=(1-Q_g_P).*n_He.*delta*sigma_He_ionization(Eg).*(lambda_g.*3.e24);

y=P_delta_final(delta,zg).*delta.*(exp(-tau));
  


