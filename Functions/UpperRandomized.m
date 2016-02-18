function [combined_all]=UpperRandomized(upper,lower_rand,upper_yoga,upper_medit,upper_streng,randomized,blockNum)
% get rid of rows of zeros created in the above for loop for the
    % lower lefs groups 
    zerolower_rand=any(lower_rand==0,2); 
    lower_rand(zerolower_rand,:)=[];
    
    % determine how many people are in each arm within lower LEFS (for
    % already randomized data)
    lower_one_rand=find(lower_rand(:,3)==1);
    lower_yoga_rand=length(lower_one_rand);
    disp(lower_yoga_rand)
    lower_two_rand=find(lower_rand(:,3)==2);
    lower_medit_rand=length(lower_two_rand);
    disp(lower_medit_rand)
    lower_three_rand=find(lower_rand(:,3)==3);
    lower_streng_rand=length(lower_three_rand);
    disp(lower_streng_rand)
    
    % determine how many people are in each arm within lower LEFS 
    upper_yoga_both=upper_yoga;
    upper_medit_both=upper_medit;
    upper_streng_both=upper_streng;
    
    test(1,1)=abs(upper_yoga_both-upper_medit_both);
    test(2,1)=abs(upper_yoga_both-upper_streng_both);
    test(3,1)=abs(upper_medit_both-upper_streng_both);
    
    disp(test)

% What is the max difference between number of people in each arm that are
% in the lower or upper lefs groups. 
    difference=max(test(:));
    
    while difference>1
        disp('Re-run randomization data until conditions are met')
        
        for b=1:length(upper(:,1)) 
            upper(b,3)=randi(3);
        end
        
        % determine how many people are in each arm within lower LEFS
        upper_one=find(upper(:,3)==1);
        upper_yoga=length(upper_one);
        disp(upper_yoga)
        upper_two=find(upper(:,3)==2);
        upper_medit=length(upper_two);
        disp(upper_medit)
        upper_three=find(upper(:,3)==3);
        upper_streng=length(upper_three);
        disp(upper_streng)
        
        upper_yoga_both=upper_yoga;
        upper_medit_both=upper_medit;
        upper_streng_both=upper_streng;

        test(1,1)=abs(upper_yoga_both-upper_medit_both);
        test(2,1)=abs(upper_yoga_both-upper_streng_both);
        test(3,1)=abs(upper_medit_both-upper_streng_both);

        disp(test)
        
        % What is the max difference between number of people in each arm that are
        % in the lower or upper lefs groups. 
        difference=max(test(:));

    end
     combined=[upper];
     combined=sortrows(combined,1);
     combined_all=[randomized;combined]
     eval (['csvwrite(''' 'Block' num2str(blockNum) '_Randomized.csv' ''', combined_all);']);
end