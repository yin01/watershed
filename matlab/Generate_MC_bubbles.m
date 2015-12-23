%%%% This generates a Monte Carlo realization of 
%%% the bubble distribution
%%%% Rbox is in Mpc
%%% Output y(1,:)=bubble size in R (Mpc)
%%% Output y(2-4,:)=x,y,z coordinates

function y=Generate_MC_bubbles(z,Rbox,R_lower,R_upper)
cosmological_parameters

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
y=zeros(4,nbubble);
y(1,:)=Rbubble;
y(2,:)=rand(1,nbubble);
y(3,:)=rand(1,nbubble);
y(4,:)=rand(1,nbubble);

