function [ iter_data ] = extractIteration( timing_data, iter )
  iter_data = timing_data(timing_data{:,'Iteration'} == iter,:);
end

