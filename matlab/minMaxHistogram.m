function [ ] = minMaxHistogram( hist_data )
  xrng = [0 1];
  yrng = [0 100];
  minloc = [xrng(2) yrng(2)] .* [0.05 0.95];
  maxloc = [xrng(2) yrng(2)] .* [0.95 0.95];
  h = histfit(hist_data,20);
  h(2).Color = [.6 .2 .2];
  xlim(xrng);
  ylim(yrng);
  strmin = ['Min = ',num2str(min(hist_data))];
  strmax = ['Max = ',num2str(max(hist_data))];
  text(minloc(1),minloc(2),strmin,'HorizontalAlignment','left');
  text(maxloc(1),maxloc(2),strmax,'HorizontalAlignment','right');
end

