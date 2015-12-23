%%%%  This generates a Monte-Carlo realization of the bubble size
%distribution
%%% overlap==0 ---> don't worry about overlaps
%%% overlap==1 ---> make sure they don't overlap

function y=generate_bubble_distribution(z,Rbox,Rlower,Rupper,DFmax,overlap)
FHZ_parameters

Q=Q_filling_factor(z);
Vbox=(Rbox.^3);
Vmax=Q.*Vbox;
V=0.;
diffR=log(Rupper)-log(Rlower);
ibubble=0.;

while (V<=Vmax)  
  lgR=log(Rlower)+rand(1,1).*diffR;
  R=exp(lgR);
  ratio=bubble_DF_spline(R)./DFmax;
  testi=rand(1,1);
  if (testi<=ratio) 
    ibubble=ibubble+1;
    y(1,ibubble)=R;
    V=V+4.*pi./3.*(R^3);
  end   
end
  
if overlap==0
      y(2:4,:)=Rbox.*rand(3,ibubble);
else
      y(2:4,1)=Rbox.*rand(3,1);
      i=2;
      while (i<=ibubble)
	npts=i-1;
	mindist=0.;
	yguess=Rbox.*rand(3,1);	
	ydiffsq=(y(1:3,1:npts)-kron(yguess,ones(1,npts))).^2;
	dist=sqrt(sum(ydiffsq,1));
	[mindist,imin]=min(dist);
	if mindist>=y(1,i)+y(1,imin)  %%% accept the point
	  y(2:4,i)=yguess;
	  i=i+1;
	end
       end
end  %%% end overlap




Qactual=V/Vbox