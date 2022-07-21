%Seleziono i punti di controllo in modo che l'ultimo e il primo coincidono
cpts = [3 5 7 4 -3 3; 4 3 2 -5 3 4];
%Scelgo l'intervallo temporale selezioando istante iniziale e finale
tpts = [0 5];
%Campioni temporali per la traiettoria, specificati come vettore
tvec = 0:0.01:5;

[q,~,~,pp] = bsplinepolytraj(cpts,tpts,tvec);
plot(cpts(1,:),cpts(2,:),'xb-');
title('Curva B-Spline chiusa')
xlabel('X')
ylabel('Y')
hold on
fnplt(pp)
