%ESEMPIO - Confronto rappresentazione circonferenza tra curva NURBS e B-Spline

close all, clear all; %pulizia workspace e command window
Punti_Controllo=[1 1 3 3 3 1 1;2 3 3 2 1 1 2]; %definizione punti di controllo
Numero_Punti_Controllo=size(Punti_Controllo,2); %numero di punti di controllo 
Vettore_Nodi=[0,0,0,0.25,0.5,0.5,0.75,1,1,1]; %definizione vettore dei nodi
Vettore_Pesi=[1 0.5 0.5 1 0.5 0.5 1]; %definizione vettore dei pesi
Ordine_Curva=3; %definizione ordine della curva

%PLOTTING CURVA NURBS
%NOTA: i punti di controllo sono (1,2)(1,3)(3,3)(3,2)(3,1)(1,1)(1,2)
%primo ed ultimo punto coincidenti (ma pesi differenti), è stato imposto
%il passaggio per il primo e l'ultimo punto aumentando la molteplicità dei
%rispettivi nodi.
Curva_Nurbs = Funzione_Nurbs(Punti_Controllo,Ordine_Curva,Vettore_Nodi,Vettore_Pesi);
Plotting_NURBS=plot(Curva_Nurbs(1,:),Curva_Nurbs(2,:),'LineWidth',1);
set(Plotting_NURBS,'Color','blue');
hold on;

%PLOTTING CURVA B-SPLINE
%Una curva B-spline può essere ottenuta da una NURBS imponendo tutti i pesi ad 1
Vettore_Pesi_Spline=[1 1 1 1 1 1 1];
Vettore_Nodi_Spline=[0:1/(Numero_Punti_Controllo+Ordine_Curva-1):1];
Curva_Spline=Funzione_Nurbs(Punti_Controllo,Ordine_Curva,Vettore_Nodi_Spline,Vettore_Pesi_Spline);
Plotting_SPLINE=plot(Curva_Spline(1,:),Curva_Spline(2,:),'LineWidth',1);
set(Plotting_SPLINE,'Color','red');
hold on;

%PLOTTING PUNTI DI CONTROLLO
plot(Punti_Controllo(1,:),Punti_Controllo(2,:),'-O','MarkerFaceColor', 'yellow');
legend('NURBS','B-Spline','Punti di Controllo');



