function [ data ] = loadAllEfficiencyData( file_prefix, num_files )
  data = cell(num_files,1);
  for ii=1:num_files
    fn = strcat(strcat(file_prefix,num2str(ii-1,'%d')),'.log');
    fid = fopen(fn,'r'); 
    C = textscan(fid,'%d64 %d64 %f %s %s','Delimiter',',','HeaderLines',1);
    fclose(fid);
    data{ii} = cell2table([num2cell(C{1}) num2cell(C{2}) num2cell(C{3}) C{4} C{5}], ...
                          'VariableNames',{'LoadStep','Iteration','Time','State','Description'});
  end
end

