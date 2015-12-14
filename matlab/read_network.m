function [ fibers, nodes ] = read_network( filename )
nums = dlmread(filename,' ', [0 0 0 2]);
data = dlmread( filename,' ', [1 0 nums(3) 8]); % load vect file skip header 
nodes = unique([data(:,2) data(:,4:6) ; data(:,3) data(:,7:9)],'rows');
nodes = nodes(:,2:4);
offset = 0;
if(min(min(data(:,2:3))) == 0)
  offset = 1;
end
fibers = [data(:,1) (data(:,2:3) + offset)];
end