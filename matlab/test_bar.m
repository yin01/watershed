t=linspace(0,2*pi,200);
r=sqrt(abs(2*sin(5*t)));
y=r.*sin(t);

figure(4)
bar(t,y)
axis([0 pi 0 inf])

figure(5)
plot(t,y)
axis([0 pi 0 inf])