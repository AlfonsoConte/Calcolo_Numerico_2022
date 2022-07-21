
%Costruisco la Matrice P dei punti di controllo
P=[1 0.5 0.5;2 2 2;3 5 6;8 1 6; 5 1 6; 10 9 6; 16 5 7; 2 3 4; 15 16 17];

syms t
%Determiniamo la matrice di Bernstein
B=bernsteinMatrix(length(P)-1,t)
Curva=simplify(B*P)

fplot3(Curva(1),Curva(2),Curva(3),[0 1],'r')
xlabel('x')
ylabel('y')
zlabel('z')
hold on
scatter3(P(:,1),P(:,2),P(:,3),'filled','b')
grid on;
hold off;