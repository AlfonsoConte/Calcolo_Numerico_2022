
n=15;
runge=@(x) 1./(1+25*x.^2);

x=linspace(-1,1,1e4);
y=runge(x);


ceby= @(i,n) cos(((2*i-1)*pi)./(2*n));

xc=ceby(1:n,n);
yc=runge(xc);

p = polyfit(xc,yc,n-1);
t = linspace(min(x),max(x),1e4);
v = polyval(p,t);

figure(1)
plot(t,v,'r');
hold on;
scatter(xc,yc,'r','filled');
xlabel('x')
ylabel('f(x)')
legend('','Polinomio di grado 15 (Cebysev)');
hold off;
