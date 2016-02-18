function [combined_all]=UpperEmpty(lower,blockNum)

% generate a random assignment into group 1, 2, or 3 for upper LEFS scores 

for c=1:length(lower(:,1)) 
    lower(c,3)=randi(3);
end

% determine how many people are in each arm within upper LEFS

    lower_one=find(lower(:,3)==1);
    lower_yoga=length(lower_one);
    disp(lower_yoga)
    lower_two=find(lower(:,3)==2);
    lower_medit=length(lower_two);
    disp(lower_medit)
    lower_three=find(lower(:,3)==3);
    lower_streng=length(lower_three);
    disp(lower_streng)

if blockNum == 1
    % determine what the difference is between the number of people in each
    % of the groups within the upper LEFS section
    test(1,1)=abs(lower_yoga-lower_medit);
    test(2,1)=abs(lower_yoga-lower_streng);
    test(3,1)=abs(lower_medit-lower_streng);
    
    % test the max difference between number of people in each arm that are
    % in the upper lefs groups 
    disp(test)
    difference=max(test(:));
 
% if the difference between groups is greater than 1 then re-do the same
% thing until the max difference is 1 or less. 
    while difference>1
        disp('Re-run randomization data until conditions are met')

        for b=1:length(lower(:,1)) 
            lower(b,3)=randi(3);
        end

        lower_one=find(lower(:,3)==1);
        lower_yoga=length(lower_one);
        disp(lower_yoga)
        lower_two=find(lower(:,3)==2);
        lower_medit=length(lower_two);
        disp(lower_medit)
        lower_three=find(lower(:,3)==3);
        lower_streng=length(lower_three);
        disp(lower_streng)

        test(1,1)=abs(lower_yoga-lower_medit);
        test(2,1)=abs(lower_yoga-lower_streng);
        test(3,1)=abs(lower_medit-lower_streng);
        disp(test)
        
        difference=max(test(:));
    end
    
% combine the people with lower and upper lefs scores into one group
    combined=[lower]; 
    combined_all=sortrows(combined,1)
eval (['csvwrite(''' 'Block' num2str(blockNum) '_Randomized.csv' ''', combined);']);

else
    eval (['randomized=csvread(''' 'Block' num2str((blockNum-1)) '_Randomized.csv' ''');' ]);
    for a=1:length(randomized(:,1));
        if randomized(a,2) == 1
            lower_rand(a,:)=randomized(a,:);
        elseif randomized(a,2) == 2
            upper_rand(a,:)=randomized(a,:);
        end
    end

    if randomized(:,2) ~= 1
        [combined_all]=LowerEmptyRandomized(lower,upper,upper_rand,lower_yoga,lower_medit,lower_streng,upper_yoga,upper_medit,upper_streng,randomized,blockNum);
    elseif randomized(:,2) ~= 2
        [combined_all]=UpperEmptyRandomized(lower,lower_rand,lower_yoga,lower_medit,lower_streng,randomized,blockNum);
    else
        [combined_all]=Randomized(lower,upper_rand,lower_rand,lower_yoga,lower_medit,lower_streng,randomized,blockNum);
    end 
end