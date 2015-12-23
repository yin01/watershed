
%%% this is a test for the coherence function to try and understand santos'
%%% results

nu2=140;
nu1=linspace(120,160);


xi=1.;
x=log(nu1./nu2)./xi;

n1=10;
y1=f_coherence(x,n1);

plot(nu1,y1)
shg

