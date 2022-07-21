
% % -> La matrice Q immagazzina i valori di interpolazione tra i punti di controllo.
% %    Q è una matrice simile ad S ma presenta un numero maggiore di valori,ovvero memorizza  
% %    gli end control points e i valori interpolati. 


function plotbeziersurface3D(S,Q)

[r c dim np]=size(S);
% % np: numero di patches

if dim > 3 or dim < 3 
    error ('plotbeziersurface3D.m function handles only 3-D points')
end

az=21;  %azimuth
el=19;  %elevation. 

lw=1; %plotting linewidth

str1='\bf Control Point';
str2='\bf Control Polygon';
str3='\bf Surface (bi-directional Bezier curve)';

% %-----------------------------------------------
% Per il plotting è conveniente separare le coordinate in specifici vettori


xS=[]; yS=[]; zS=[];
for k=1:np
     xS =horzcat(xS, reshape(S(:,:,1,k),1,[]));  %Concatenazione orizzontale
     yS =horzcat(yS, reshape(S(:,:,2,k),1,[]));
     zS =horzcat(zS, reshape(S(:,:,3,k),1,[]));     
end

xQ=[]; yQ=[]; zQ=[];
for k=1:np
     xQ =horzcat(xQ, reshape(Q(:,:,1,k),1,[])); 
     yQ =horzcat(yQ, reshape(Q(:,:,2,k),1,[])); 
     zQ =horzcat(zQ, reshape(Q(:,:,3,k),1,[]));    
end
% %------------------------------------------------
% %  Plot della superficie di Bezier utilizzando l'interpolazione dei punti di controllo
% %  I punti di controllo e il poligono di controllo vengono evidenziati.
figure, hold on
plot3(xS,yS,zS,'ro','LineWidth',lw)
plot3(xS,yS,zS,'g','LineWidth',lw)
plot3(xQ,yQ,zQ,'b','LineWidth',lw)
legend(str1,str2,str3);
title('\bf Wireframe Plot of a Bezier Surface with Control Points and Control Polygon') 
view(3); box;  view(az,el)
% %-----------------------------------------------
% % Plot della superficie di Bezier utilizzando l'interpolazione dei punti di controllo.
figure, hold on
plot3(xQ,yQ,zQ,'b','LineWidth',lw)
legend(str3);
title('\bf Wireframe Plot of a Bezier Surface') 
view(3); box;  view(az,el)
% %-----------------------------------------------
% % Plot utilizzando i punti di controllo
figure, hold on
for k=1:np
    surface(S(:,:,1,k),S(:,:,2,k),S(:,:,3,k),'FaceColor','green')
end
title('\bf Bezier Surface using Control Points'); 
view(3); box;  view(az,el)
% %-----------------------------------------------
% % Plot utilizzando l'inteprlazione dei punti di controllo.
figure, hold on
for k=1:np
    surface(Q(:,:,1,k),Q(:,:,2,k),Q(:,:,3,k),'FaceColor','green')
end
title('\bf Bezier Surface using Interpolated Points'); 
view(3); box;  view(az,el)

