function [combined_all]=LowerEmpty(upper,blockNum)

% generate a random assignment into group 1, 2, or 3 for upper LEFS scores 

for c=1:length(upper(:,1)) 
    upper(c,3)=randi(3);
end

% determine how many people are in each arm within upper LEFS

    upper_one=find(upper(:,3)==1);
    upper_yoga=length(upper_one);
    disp(upper_yoga)
    upper_two=find(upper(:,3)==2);
    upper_medit=length(upper_two);
    disp(upper_medit)
    upper_three=find(upper(:,3)==3);
    upper_streng=length(upper_three);
    disp(upper_streng)

if blockNum == 1
    % determine what the difference is between the number of people in each
    % of the groups within the upper LEFS section
    test(1,1)=abs(upper_yoga-upper_medit);
    test(2,1)=abs(upper_yoga-upper_streng);
    test(3,1)=abs(upper_medit-upper_streng);
    
    % test the max difference between number of people in each arm that are
    % in the upper lefs groups 
    disp(test)
    difference=max(test(:));
 
% if the difference between groups is greater than 1 then re-do the same
% thing until the max difference is 1 or less. 
    while difference>1
        disp('Re-run randomization data until conditions are met')

        for b=1:length(upper(:,1)) 
            upper(b,3)=randi(3);
        end

        upper_one=find(upper(:,3)==1);
        upper_yoga=length(upper_one);
        disp(upper_yoga)
        upper_two=find(upper(:,3)==2);
        upper_medit=length(upper_two);
        disp(upper_medit)
        upper_three=find(upper(:,3)==3);
        upper_streng=length(upper_three);
        disp(upper_streng)

        test(1,1)=abs(upper_yoga-upper_medit);
        test(2,1)=abs(upper_yoga-upper_streng);
        test(3,1)=abs(upper_medit-upper_streng);
        disp(test)
        
        difference=max(test(:));
    end
    
% combine the people with lower and upper lefs scores into one group
    combined=[upper]; 
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
        [combined_all]=LowerRandomized(upper,upper_rand,upper_yoga,upper_medit,upper_streng,randomized,blockNum);
    elseif randomized(:,2) ~= 2
        [combined_all]=UpperRandomized(upper,lower_rand,upper_yoga,upper_medit,upper_streng,randomized,blockNum);
    else
        [combined_all]=RandomizedOther(upper,upper_rand,lower_rand,lower_yoga,lower_medit,lower_streng,randomized,blockNum);
    end 
end
    