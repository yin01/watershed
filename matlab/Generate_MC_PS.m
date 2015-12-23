%%%% This generates a Monte Carlo realization of a Press-Schechter
%distribution
%%%% Rbox is in Mpc
%%% Output y(1,:)=

function y=Generate_MC_PS(z,Rbox,M_lower,M_upper)
cosmological_parameters

%%%% Total mass in box

rho_m=2.684e11.*h.*h.*Omega_m;
Mbox=rho_m.*(Rbox.^3).*collapsed_mass_fraction(M_lower,z)

if (M_upper>Mbox/4) 
  disp('Mbox is too small')
  pause
end

%%% First draw from comparison function
%%% Then decide whether to accept or not
Mtot=0.;
nguess=round(Mbox./non_linear_mass(1.5,z))
diff=log10(M_upper)-log10(M_lower);
Mhalo=10.^(log10(M_lower)+diff.*rand(1,nguess));
i=0;

while (Mtot<Mbox)
i=i+1
Mvec=10.^(log10(M_lower)+diff.*rand(1,nguess));
Mround=sum(Mvec);
Mtot=Mtot+Mround;
Mfrac=Mtot/Mbox
Mhalo=[Mhalo Mvec];
end

%% clip the last one
Msum=cumsum(Mhalo);
size(Mhalo)
nhalos=min(find(Msum>Mbox))
Mhalo=Mhalo(1:nhalos);
Mfrac=sum(Mhalo)/Mbox





%%% now produce final vector
%%% for now, don't worry about overlaps
y=zeros(4,nhalos);
y(1,:)=Mhalo;
y(2,:)=rand(1,nhalos);
y(3,:)=rand(1,nhalos);
y(4,:)=rand(1,nhalos);

