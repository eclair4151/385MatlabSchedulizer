% CS385 - Final Project
% David Monteleone, Tomer Shemesh, Kelly Shiptoski

% Crossover Function
function child = CrossBreed( classes1, classes2,all_classes, preferences )
    error = true;
    
    while error == true
       error = false;
       child = cell(size(classes1));
       
       % For each class position, randomly pick one from one of the parents
       % to place in the new child
       for i = 1:size(classes1)
            if round(rand)
                if Fits(child,classes1{i})
                    child{i} = classes1{i};
                elseif Fits(child,classes2{i})
                    child{i} = classes2{i};
                end    
            else  
                if Fits(child,classes2{i})
                    child{i} = classes2{i};
                elseif Fits(child,classes1{i})
                    child{i} = classes1{i};
                end
            end  
            if isempty(child{i})
                error = true;
                break;
            end    
       end 
    end    
   
    
    % Give a 33% chance to mutate
    % Mutation is selecting a random class in child and replacing with
    % another random section of that class
    if randi(3,1,1) == 1
       classSwap = randi(size(child),1,1);
       nums = size(all_classes{classSwap},1);
       order_to_try = randperm(nums);
       for i = 1:nums
            if Fits(child,all_classes{classSwap}(order_to_try(i)))
                child{classSwap} = all_classes{classSwap}(order_to_try(i));
                break;
            end  
       end    
    end

end

