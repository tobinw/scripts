function [ step_data ] = extractStep(timing_data, step)
  step_data = timing_data(timing_data{:,'LoadStep'} == step,:);
end

