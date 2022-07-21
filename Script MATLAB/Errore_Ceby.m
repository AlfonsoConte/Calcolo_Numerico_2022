err = zeros(40,1);
ceby= @(i,n) cos(((2*i-1)*pi)./(2*n));
runge=@(x) 1./(1+25*x.^2);
for i = 1:40
    xc = ceby(1:i+1,i+1);
    yc = runge(xc);
    p = polyfit(xc,yc,i);
    t = linspace(min(xc),max(xc),1e4);
    v = polyval(p,t);
    y = runge(t);
    err(i) = norm(y-v);
end
figure(1)
semilogy(err,'b');
grid on
xlabel('Grado del polinomio interpolante')
ylabel('Andamento dell''Errore')
clear