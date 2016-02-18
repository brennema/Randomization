function [combined_all]=LowerRandomized(lower,upper_rand,lower_yoga,lower_medit,lower_streng,randomized,blockNum)
    % get rid of rows of zeros created in the above for loop for the
    % lower lefs groups 
    zeroupper_rand=any(upper_rand==0,2); 
    upper_rand(zeroupper_rand,:)=[];
    
    % determine how many people are in each arm within lower LEFS (for
    % already randomized data)
    upper_one_rand=find(upper_rand(:,3)==1);
    upper_yoga_rand=length(upper_one_rand);
    disp(upper_yoga_rand)
    upper_two_rand=find(upper_rand(:,3)==2);
    upper_medit_rand=length(upper_two_rand);
    disp(upper_medit_rand)
    upper_three_rand=find(upper_rand(:,3)==3);
    upper_streng_rand=length(upper_three_rand);
    disp(upper_streng_rand)
    
    % determine how many people are in each arm within lower LEFS 
    lower_yoga_both=lower_yoga;
    lower_medit_both=lower_medit;
    lower_streng_both=lower_streng;
    
    test(1,1)=abs(lower_yoga_both-lower_medit_both);
    test(2,1)=abs(lower_yoga_both-lower_streng_both);
    test(3,1)=abs(lower_medit_both-lower_streng_both);
    
    disp(test)

% What is the max difference between number of people in each arm that are
% in the lower or upper lefs groups. 
    difference=max(test(:));
    
    while difference>1
        disp('Re-run randomization data until conditions are met')
        
        for a=1:length(lower(:,1)) 
            lower(a,3)=randi(3);
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
        
        lower_yoga_both=lower_yoga;
        lower_medit_both=lower_medit;
        lower_streng_both=lower_streng;

        test(1,1)=abs(lower_yoga_both-lower_medit_both);
        test(2,1)=abs(lower_yoga_both-lower_streng_both);
        test(3,1)=abs(lower_medit_both-lower_streng_both);

        disp(test)
        
        % What is the max difference between number of people in each arm that are
        % in the lower or upper lefs groups. 
        difference=max(test(:));

    end
     combined=[lower];
     combined=sortrows(combined,1);
     combined_all=[randomized;combined]
     eval (['csvwrite(''' 'Block' num2str(blockNum) '_Randomized.csv' ''', combined_all);']);
end
