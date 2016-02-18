function [combined_all]=Randomization(blockNum)

warning('off');
rng('shuffle');

eval (['data=xlsread(''' 'Block' num2str(blockNum) '.xls' ''');' ]);

% break the block into those that have a high and those that have a low
% LEFS
for a=1:length(data(:,1));
    if data(a,2) == 1
        lower(a,:)=data(a,:);
    elseif data(a,2) == 2
        upper(a,:)=data(a,:);
    end
end

% if there are all 2's or all 1's for the LEFS score in a block
if data(:,2) ~= 1
    [combined_all]=LowerEmpty(upper,blockNum);
elseif data(:,2) ~= 2
    [combined_all]=UpperEmpty(lower,blockNum);
else
    [combined_all]=Random(lower,upper,blockNum);
end 
end