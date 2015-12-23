%%% This tests the Monte-Carlo code for the bubble

initialize_cosmology;
initialize_FHZ;
%%%initialize_sigmaM_spline;

%%%% set uppper and lower limits for bubble size


z=9.;
Rupper=Rcutoff_DF(100.,1.e-3,z)
Rlower=Rcutoff_DF(1.e-3,1.e-2,z)
initialize_spline_bubble_size(z,Rlower,Rupper);

DFmax=abs(fminbnd(@DF_func,log(Rlower),log(Rupper)));

area_guess=DFmax.*(log(Rupper)-log(Rlower));
area_DF=abs(quadl(@DF_func,log(Rlower),log(Rupper)));
acceptance_rate=area_DF/area_guess;

r=logspace(log10(Rlower),log10(Rupper));
DF=bubble_DF_spline(r);


Rbox=500.;
Bubbles_matrix=generate_bubble_distribution(z,Rbox,Rlower,Rupper,DFmax,1);

%%% write this to disk
mat=Bubbles_matrix';

save bubbles_500Mpc_zeta12_z9.dat mat -ascii

figure(1)
semilogx(r,DF)
shg

matDF=[r' DF'];
save bubbles_DF_zeta12_z9.dat matDF -ascii 

%figure(2)
%semilogx(r(2:end),dydx)
%shg

%%% check that bubble size distribution conforms to the theoretical one

R_sample=log10(Bubbles_matrix(1,:));
nbins=20;
x=linspace(min(R_sample),max(R_sample),nbins);
yhist=hist(R_sample,x).*exp(3*x);
figure(3)
bar(x,yhist)
shg
