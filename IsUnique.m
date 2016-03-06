% CS385 - Final Project
% David Monteleone, Tomer Shemesh, Kelly Shiptoski

% Checks classes for uniqueness
function unique = IsUnique( fitness,classes )
    % Checks classes for uniqueness
    unique = true;
    for i=1:size(classes,1)
        if isempty(classes{i,1})
            break;
        elseif round(fitness,2) == round(classes{i,2},2)
            unique = false;
            break;
        end    
    end    
end

