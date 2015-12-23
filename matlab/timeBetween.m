function [ time ] = timeBetween( datatable, evnt1, evnt2 )
  pre = datatable(cellfun(@isnotempty,strfind(datatable.Description,evnt1)),:);
  post = datatable(cellfun(@isnotempty,strfind(datatable.Description,evnt2)),:);
  % assumes that post and pre are single rows from the table...
  time = post.Time - pre.Time;
end