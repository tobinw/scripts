function [ time ] = timeFor2( data, evnt )
  pre_desc = strcat('PRE_', evnt);
  post_desc = strcat('POST_',evnt);
  time = timeBetween(data,pre_desc,post_desc);
end

