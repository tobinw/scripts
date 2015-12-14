function [ ] = renderHistogramAnimation( hist_data )
v = prepVidObject('meshQualityHistogram.avi',4);
f = figure('units','normalized','outerposition',[0 0 1 1],'visible','off');
open(v);
[~,iters] = size(hist_data)
for ii = 1:iters
    minMaxHistogram(hist_data(:,ii))
    writeVideo(v,getframe(f));
end
close(v);
end
