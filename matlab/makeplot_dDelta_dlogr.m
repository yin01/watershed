%%% This makes the plot of the slope d(logDelta)/d(logr) and sees 
%%% if it is above or below -3/2

delta=logspace(-1,2.9);

z=6.;
r=(f_v_full(delta,z)).^0.3333;
lgr=log(r);
lgdelta=log(delta);

dDelta=diff(lgdelta)./diff(lgr);

semilogx(delta(1:end-1),dDelta)
axis([0.1 1.e3 -3. 10.])
shg