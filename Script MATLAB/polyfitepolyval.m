%Insieme di dati
x=[-55 -25 5 35 65] ;
y=[-3.25 -3.2 -3.02 -3.32 -3.1];
%poli nomio interpolatore di ordine 4
c=polyfit(x,y,4)
%vettore di 100 punti equispaziati nell'intervallo
%tra la prima e l'ultima componente del vettore x
%che serve per generare il plot del polinomio

z=linspace(x(1),x(end),100);
p=polyval(c,z);
plot(z,p,x,y,'r *');
grid on;
legend('polinomio interpolatore di grado 4','insieme di dati')