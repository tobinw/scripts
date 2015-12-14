function plot_mesh( fibers, nodes )
% node      N-by-3 array of xyz coordinates for N nodes
% fibers    N-by-2 array of start-end nodes for N fibers

plot3( nodes(:,1) , nodes(:,2), nodes(:,3),'o', ...  
    'LineWidth',1, 'MarkerEdgeColor','k', ...
    'MarkerFaceColor', [0.5 0.5 0.8], 'MarkerSize',3 );
hold on;
for n = 1:size(fibers,1) % count rows
  c = nodes(fibers(n,2:3),:);
  plot3(c(:,1),c(:,2),c(:,3),'color','black');
end
set(gcf, 'color', 'white');
axis equal;
hold off;
end