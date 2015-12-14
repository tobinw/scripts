function [ v ] = avg_fiber_dir( f, n )
  v = sum(fiber_dir(n(f(:,2),:),n(f(:,3),:)));
  v = v ./ norm(v);
  v = [v ; -v];
end

