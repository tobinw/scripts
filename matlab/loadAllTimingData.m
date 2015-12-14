function [ data ] = loadAllTimingData( file_prefix, num_files )
  data = cell(num_files);
  for ii=1:num_files
    fn = strcat(strcat(file_prefix,num2str(ii-1,'%d')),'.log');
    data{ii} = importdata(fn);
  end
end

