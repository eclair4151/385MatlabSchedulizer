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
    
    function fits = Fits(schedule, class)
        
        fits = true;
        for k=1:size(schedule)
            cur_class = schedule{k};
            if ~isempty(cur_class)
                cur_str = strsplit(cur_class.days_time_string,' ');
                cur_days = num2cell(char(cur_str(1)));
                
                class_str = strsplit(class.days_time_string,' ');
                days = num2cell(char(class_str(1)));
                
                if(~isempty(intersect(days,cur_days)))
                   class_begin = datetime((datenum(class.begin_time,'yyyy-mm-ddTHH:MM:SS.FFF-05:00')), 'ConvertFrom', 'datenum');
                   class_begin = class_begin.Hour*100 + class_begin.Minute;
                   
                   class_end = datetime((datenum(class.end_time,'yyyy-mm-ddTHH:MM:SS.FFF-05:00')), 'ConvertFrom', 'datenum');
                   class_end = class_end.Hour*100 + class_end.Minute;
                   
                   cur_class_begin = datetime((datenum(cur_class.begin_time,'yyyy-mm-ddTHH:MM:SS.FFF-05:00')), 'ConvertFrom', 'datenum');
                   cur_class_begin = cur_class_begin.Hour*100 + cur_class_begin.Minute;

                   cur_class_end = datetime((datenum(cur_class.end_time,'yyyy-mm-ddTHH:MM:SS.FFF-05:00')), 'ConvertFrom', 'datenum');
                   cur_class_end = cur_class_end.Hour*100 + cur_class_end.Minute;
                   
                   if class_end > cur_class_begin && class_begin < cur_class_end
                       fits = false;
                   end    
                end    
            end    
        end  
   
    end

end







