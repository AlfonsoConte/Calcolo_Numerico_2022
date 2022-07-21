load x;
load y;
P=[x y];
x1=sort(x)
t=linspace(x1(1),x1(18),1e4);
f=interp1(P(:,1),P(:,2),t);
figure(1);
hold on;
axis('equal');
set(gca, 'YDir','reverse');
plot(t,f,'r')
hold on
scatter(P(:,1),P(:,2),'or','filled')
xlabel('X')
ylabel('Y')
grid on
axis tight