function unique = IsUnique( fitness,classes )
%ISUNIQUE Summary of this function goes here
%   Detailed explanation goes here
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

