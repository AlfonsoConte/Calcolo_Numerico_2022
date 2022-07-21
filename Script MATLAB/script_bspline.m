%Assegniamo la sequenza di nodi
t=[0 1.3 2.5 3 5];

figure( 1)
title('Plot with bspline(t)')
bspline(t)
figure(2)
title('Plot with fnplt(pp)')
pp = bspline(t);
%Plot della pp-form
fnplt(pp)