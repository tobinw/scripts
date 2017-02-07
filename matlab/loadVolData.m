function [ data ] = loadVolData( file )
  data = csvread(file,1,0);
end
