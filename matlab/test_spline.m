%%%%% This program tests the use of 
%%%  a spline fitting function on the data

load -ascii frequency_tc.dat

freq=reshape(frequency_tc',256,1);

load -ascii x10y100.dat
%%%load -ascii x10y100_real.dat

ndim=128;

x=freq(1:ndim);
y=x10y100(1:ndim);



figure(1)
plot(x,y)

figure(2)
loglog(x,y)

%%% First do the log-log fits

%%lgfreq=log(freq);
%%%lgy=log(y);



%%lgfreq=log(small_freq);
%%lgy=log(small_y);

lgx=(x);
lgy=(y);

coeff_guess=[1, 1, 1];

[coeff,resnorm]=lsqcurvefit(@quadratic_poly,coeff_guess,lgx,lgy);

ysmooth=(quadratic_poly(coeff,lgx));
%%sp=spaps(lgx,lgy,3.e-3/256);
%%%%ysmooth=(fnval(sp,lgx));
signal=y-ysmooth;

sp2=spaps(lgx,lgy,3.e-3/256);
ysmooth2=exp(fnval(sp2,lgx));
signal2=y-ysmooth2;

sp3=spaps(lgx,lgy,3.e-3/256);
ysmooth3=exp(fnval(sp3,lgx));
signal3=y-ysmooth3;

figure(3)
plot(x,signal,'red')
hold on
%plot(x,signal2)
%plot(x,signal3)
hold off

shg

ys3=ysmooth2-ysmooth;

