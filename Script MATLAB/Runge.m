n=10
x=linspace(-1,1,n);
runge=@(x) 1./(1+25*x.^2);
y=runge(x);
c=polyfit(x,y,n-1);

%Rappresentiamo graficamente il polinomio e la funzione
z=linspace(-1,1,1000);
p=polyval(c,z);
plot(x,y,'o--b',z,p);
legend('Funzione di Runge','Polinomio interpolatore di grado n','FontSize',11)
