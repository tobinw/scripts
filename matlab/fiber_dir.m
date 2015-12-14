function [ d ] = fiber_dir( n1, n2 )
  d = n2 - n1;
  if(d(1) < 0)
    d = d * -1.0;
  end
end

