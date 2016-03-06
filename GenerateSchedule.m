% CS385 - Final Project
% David Monteleone, Tomer Shemesh, Kelly Shiptoski

% Generate a random schedule of desired classes
function schedule = GenerateSchedule( all_classes )
    schedule = cell(size(all_classes,1));
    i = 1;
    % Generate a random schedule of desired classes
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







