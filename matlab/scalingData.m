function [ data ] = scalingData( process_counts, prfx )
    if not(exist('prfx'))
        prfx='';
    end
    [runs,~] = size(process_counts);
    data = zeros(4,runs);
    for ii=1:runs
        process_counts(ii,:)
        num_macro = process_counts(ii,1);
        num_micro = process_counts(ii,2);
        pwd=prfx;
        pwd=strcat(pwd,num2str(num_macro));
        pwd=strcat(pwd,'_');
        pwd=strcat(pwd,num2str(num_micro));
        pwd=strcat(pwd,'/');
        eff_prefix = strcat(pwd,'macro_efficiency.');
        eff_data = loadAllEfficiencyData(eff_prefix,num_macro);
        ts_ma = zeros(num_macro,3);
        for jj=1:num_macro
            s1i1_ma = extractIteration(extractStep(eff_data{jj},1),1);
            x = timeFor(s1i1_ma,'SOLVE');
            y = timeFor(s1i1_ma,'ASSEMBLE');
            if isnotempty(x)
              ts_ma(jj,3) = y;
              ts_ma(jj,2) = x;
              ts_ma(jj,1) = s1i1_ma.Time(end) - s1i1_ma.Time(1);
            else
              ts_ma(jj,3) = 0;
              ts_ma(jj,2) = 0;
              ts_ma(jj,1) = 0;
            end
        end
        data(1,ii) = max(ts_ma(:,1));
        data(2,ii) = max(ts_ma(:,2));
        data(3,ii) = max(ts_ma(:,3));
        
        eff_prefix = strcat(pwd,'micro_fo_efficiency.');
        eff_data = loadAllEfficiencyData(eff_prefix,num_micro);
        ts_mi = zeros(num_micro,1);
        for jj=1:num_micro
            s1i1_mi = extractIteration(extractStep(eff_data{jj},1),1);
            ts_mi(jj) = timeFor(s1i1_mi,'SOLVE');
        end
        data(4,ii) = max(ts_mi);
    end
end

