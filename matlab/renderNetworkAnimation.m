function [] = renderNetworkAnimation( fibers, nodes, filename )
  v = prepVidObject(filename,5);
  f = figure('visible','off');
  open(v);
  num_frames = size(fibers);
  for ii = 1:num_frames
    fi = fibers{ii};
    ni = nodes{ii};
    plot_network_avg_dir(fi,ni);
    drawnow;
    writeVideo(v,getframe(f));
    
    
    
  end
  close(v);
end
