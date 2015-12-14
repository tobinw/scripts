function [ mesh_quality ] = getMeshQuality( filename_prefix, filename_suffix )
  file_wildcard = strcat(filename_prefix,'*',filename_suffix);
  files = dir(file_wildcard);
  
  num_parts = length(files);
  quality_array = cell(num_parts,1);
  for ii=1:num_parts
    quality_array{ii} = reshape(load(files(ii).name),1,[]);
  end
  mesh_quality = reshape([quality_array{:}],[],1);
end

