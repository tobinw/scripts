function [ data ] = loadAllWeightData( file_prefix, num_files )
  data = cell(num_files,1);
  for ii=1:num_files
    fn = strcat(strcat(file_prefix,num2str(ii-1,'%d')),'.log');
    fid = fopen(fn,'r'); 
    C = textscan(fid,'%d %d','Delimiter',',','HeaderLines',1);
    fclose(fid);
    data{ii} = cell2table([num2cell(C{1}) num2cell(C{2})], ...
                          'VariableNames',{'LoadStep','Weight'});
  end
end

