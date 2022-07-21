%ESEMPIO - Confronto rappresentazione circonferenza tra curva NURBS e B-Spline
close all, clear all; 

%%PLOTTING CURVA NURBS ORDINE 5
load y_teapot;
load x_teapot;
Punti_Controllo=[x';y']; %definizione punti di controllo
Numero_Punti_Controllo=size(Punti_Controllo,2); %numero di punti di controllo 
Vettore_Nodi=[0,0,0, 0.25,0.25,0.25, 0.35,0.35,0.35, 0.5,0.5,0.5, 0.6,0.6, 0.75,0.75,0.75, 0.8,0.8,0.8, 1,1,1];
Vettore_Pesi=[1 1 0.80 1 0.5 0.6 0.9 1 1 0.6 0.6 0.95 0.93 0.55 0.9 0.3 1 1]; %definizione vettore dei pesi
Ordine_Curva=5; 
Curva_Nurbs =  Funzione_Nurbs(Punti_Controllo,Ordine_Curva,Vettore_Nodi,Vettore_Pesi);
axis('equal');
set(gca,'YDir','reverse')
Plotting_NURBS=plot(Curva_Nurbs(1,:),Curva_Nurbs(2,:),'LineWidth',1);
set(Plotting_NURBS,'Color','blue');
hold on;

%PLOTTING PUNTI DI CONTROLLO
axis('equal');
set(gca,'YDir','reverse')
plot(Punti_Controllo(1,:),Punti_Controllo(2,:),'-O','MarkerFaceColor', 'yellow');
legend('NURBS','Punti di Controllo');





