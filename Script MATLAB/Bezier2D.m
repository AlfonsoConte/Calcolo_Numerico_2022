
load x;
load y;
P=[x y];
syms t
B=bernsteinMatrix(length(P)-1,t);
bezierCurve = simplify(B*P);

figure(1);
hold on;
axis('equal');
set(gca, 'YDir','reverse');
fplot(bezierCurve(1), bezierCurve(2), [0, 1])
xlabel('X')
ylabel('Y')
hold on
scatter(x, y,'filled')



syms t
x1=x;
x1(9)=-50;
y1=y;
y1(9)=10;
P=[x1 y1];
B=bernsteinMatrix(length(P)-1,t);
bezierCurve = simplify(B*P);

fplot(bezierCurve(1), bezierCurve(2), [0, 1])
xlabel('X')
ylabel('Y')
scatter(x, y,'filled')
hold off