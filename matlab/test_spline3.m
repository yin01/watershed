%%%%% This program tests the use of 
%%%  a spline fitting function on the data

load -ascii frequency_tc.dat

freq=reshape(frequency_tc',256,1);

load -ascii x10y100.dat
load -ascii x10y100_real.dat
load -ascii x10y100_imaginary.dat

ndim=256;

x=freq(1:ndim);
yactual=x10y100(1:ndim)
yreal=x10y100_real(1:ndim);
yimag=x10y100_imaginary(1:ndim);


figure(1)
plot(x,yreal)

figure(2)
plot(x,yimag)

