function [ ] = plot_network_avg_dir( f, n )
l = avg_fiber_dir(f,n) * 0.23;

subplot(2,2,1);
xlabel('x');
ylabel('y');
zlabel('z');
plot_mesh(f,n);
hold on
plot3(l(:,1),l(:,2),l(:,3),'LineWidth',4);
hold off

cla(subplot(2,2,2));
xlabel('x');
ylabel('y');
zlabel('z');
plot_mesh(f,n);
hold on
plot3(l(:,1),l(:,2),l(:,3),'LineWidth',4);
view([0 0])
hold off

cla(subplot(2,2,3));
xlabel('x');
ylabel('y');
zlabel('z');
plot_mesh(f,n);
hold on
plot3(l(:,1),l(:,2),l(:,3),'LineWidth',4);
view([90 0]);
hold off

cla(subplot(2,2,4));
xlabel('x');
ylabel('y');
zlabel('z');
plot_mesh(f,n);
hold on
plot3(l(:,1),l(:,2),l(:,3),'LineWidth',4);
view([0 90]);
hold off
end

