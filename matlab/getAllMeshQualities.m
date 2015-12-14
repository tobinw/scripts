function [ mesh_quality_matrix ] = getAllMeshQualities( num_steps )
file_suffix = '.dat';
mesh_quality_matrix = [];
for ii = 0:num_steps
  file_prefix = strcat('mesh_quality_step',num2str(ii,'%d'),'.');
  mesh_quality_matrix = [mesh_quality_matrix getMeshQuality(file_prefix,file_suffix)];
end
end

