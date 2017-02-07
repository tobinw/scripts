function [ data ] = loadVolData_forCases( dir, cases )
  for ii=1:length(cases);
      cs=cases{ii};
      data(:,ii)=loadVolData(strcat(dir,'/',cs,'/vols.log'));
  end
end

