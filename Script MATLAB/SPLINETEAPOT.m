
load x
load y

P=[x y];
%Seleziono i punti di controllo
controlPoints = P';
%Scelgo l'intervallo temporale selezioando istante iniziale e finale
tInterval = sort(x);
%Campioni temporali per la traiettoria, specificati come vettore
tSamples = P(:,2);

figure(1);
hold on;
axis('equal');
set(gca, 'YDir','reverse')
[q,~,~,pp]=bsplinepolytraj(controlPoints,tInterval,tSamples)
plot(controlPoints(1,:),controlPoints(2,:),'xb-');
title('Curva B-Spline')
xlabel('X')
ylabel('Y')
hold on
fnplt(pp)