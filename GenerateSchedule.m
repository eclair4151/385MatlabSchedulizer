function schedule = GenerateSchedule( all_classes )
%GENERATESCHEDULE Summary of this function goes here
%   Detailed explanation goes here
    schedule = cell(size(all_classes,1));
    i = 1;
    
    while i <= size(all_classes,1)
        nums = size(all_classes{i},1);
        order_to_try = randperm(nums);
        for j=1:nums
            if Fits(schedule,all_classes{i}(order_to_try(j)))
                schedule{i} = all_classes{i}(order_to_try(j));
                break;
            end    
        end 
        if isempty(schedule{i})
            schedule = cell(size(all_classes,1));
            i=1;
        else
            i = i + 1;
        end    
        
    end      
      
end







