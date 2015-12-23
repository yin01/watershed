%%%% This is the linear fit to B
%%% M is input in M_solar h^-1

function y=B_func(M,z)
FHZ_parameters

nvec=max(length(M),length(z));
dummy_vec=ones(1,nvec);

Mmin=mass_from_Tvir(1.e4,z);
sigMminsq=(sigma_M(Mmin).^2).*dummy_vec;
sigMsq=(sigma_M(M).^2).*dummy_vec;

B1=K_global./sqrt(2.*(sigMminsq));

y=B_o_func(z)+B1.*sigMsq;
