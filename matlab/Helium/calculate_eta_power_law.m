
%%% this decomposes eta into a series of np broken power
%laws

function calculate_eta_power_law(np)
global np_g N_HI_breaks_g eta_o_g alpha_o_g

N_HI=logspace(13.,19.,200);
eta=eta_fardal_spline(N_HI);
  
alpha=gradient(log(eta),log(N_HI));

%% first break when start deviating from a constant

%%%ind1=min(find((alpha>0)&(alpha<0.4)));
ind1=min(find(eta>1.05*eta(1)));
[eta_max,ind2]=max(eta);
ind3=min(find(abs(alpha+1)<1.e-4));

N_HI_min=N_HI(ind1);
N_HI_2=N_HI(ind2);
N_HI_max=N_HI(ind3);

N_HI_coarse=logspace(log10(N_HI_min),log10(N_HI_max),np-1);

N_HI_breaks=zeros(1,np);
eta_o=zeros(1,np);
alpha_o=zeros(1,np);

N_HI_breaks=[N_HI_coarse 1.e22];
eta_o(1)=eta_fardal_spline(1.e13);
alpha_o(1)=0.;
eta_o(np)=eta_fardal_spline(N_HI_breaks(np)).*(N_HI_breaks(np)./1.5757e17);
alpha_o(np)=1.;

for i=2:np-1
  N_HI=logspace(log10(N_HI_breaks(i-1)),log10(N_HI_breaks(i)),20);
  x=N_HI./1.5757e17;
  eta=eta_fardal_spline(N_HI);
  p=polyfit(log(x),log(eta),1);
  eta_o(i)=exp(p(2));
  alpha_o(i)= -p(1);
end

%%% put it into common blocks
np_g=np;
N_HI_breaks_g=N_HI_breaks;
eta_o_g=eta_o;
alpha_o_g=alpha_o;


