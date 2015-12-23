
%%% this is a modified version where you supply the N_HI as a function of
% r

function y=compute_fN_Zheng2(r,N_HI)

B=2./(11.1^2);  %%% this normalization is so that the probability of
                %intersecting a halo within the virial radius is unity
                
fN_spline=fnder(spline(log(N_HI),log(r)));

drdN=fnval(fN_spline,log(N_HI)).*r./N_HI;

%%%drdN=gradient(r,N_HI);

y=abs(B.*drdN.*r);

