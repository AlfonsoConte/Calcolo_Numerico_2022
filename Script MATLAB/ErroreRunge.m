
err= zeros(50,1);
runge=@(x) 1./(1+25*x.^2);

for i=1:50
    x=linspace(-1,1,i+1);
    y= runge(x);
    p = polyfit(x,y,i);
    t = linspace(min(x),max(x),1e4);
    v = polyval(p,t);
    yt= runge(t);
    err(i) =norm(yt-v,inf);
end
figure(1)
semilogy(err,'r');
xlabel('Grado del polinomio interpolante')
ylabel('Errore')
grid on;