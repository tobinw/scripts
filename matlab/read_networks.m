function [ f, n ] = read_networks( file_prefix , num_networks)
  f = cell(num_networks,1);
  n = cell(num_networks,1);
  for ii=1:num_networks
    filename = strcat(strcat(file_prefix,num2str(ii,'%d')),'.txt');
    [f{ii}, n{ii}] = read_network(filename);
  end
end

