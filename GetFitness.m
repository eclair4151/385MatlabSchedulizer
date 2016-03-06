% CS385 - Final Project
% David Monteleone, Tomer Shemesh, Kelly Shiptoski

% Returns the fitness value for a set of classes
function fitness = GetFitness( classes, preferences )
    % Setting up objects/structs to store information needed to score based
    % on user preference
    online_classes = 0;
    mapObj = containers.Map();
    mapkeys = ['M','T','W','R','F','S'];
    for i = 1:size(mapkeys,2)
        mapObj(char(mapkeys(i))) = [10000,0,0];
    end    
    
    % Obtaining information from schedule and mapping for scoring use
    for i=1:size(classes,1)
       class_str = strsplit(classes{i}.days_time_string,' ');
       if strcmp(char(class_str(1)),char('TBD'))
           online_classes = online_classes +1;
       else
           days = num2cell(char(class_str(1)));
           class_begin = datetime((datenum(classes{i}.begin_time,'yyyy-mm-ddTHH:MM:SS.FFF-05:00')), 'ConvertFrom', 'datenum');
           class_begin = class_begin.Hour*100 + class_begin.Minute;

           class_end = datetime((datenum(classes{i}.end_time,'yyyy-mm-ddTHH:MM:SS.FFF-05:00')), 'ConvertFrom', 'datenum');
           class_end = class_end.Hour*100 + class_end.Minute;
           for j=1:size(days,2)
               time = mapObj(char(days(j)));
               if class_begin < time(1)
                   time(1) = class_begin;
               end  
               
               if class_end > time(2)
                   time(2) = class_end;
               end
               time(3) = time(3) +1;
               mapObj(char(days(j))) = time;
               
           end      
       end    
    end    
    
    % Get individual preferences scores and add to total points 'fitness'
    fitness = 0;
    
    fitness = fitness + (preferences.online_classes * online_classes);
    fitness = fitness + ((10-preferences.online_classes) * (size(classes,1) - online_classes))/2;
    
    for i = 1:size(mapkeys,2)
        times = mapObj(char(mapkeys(i)));
        if times(3) ~= 0
            fitness = fitness + ((14-((times(2) - times(1))/100)) * preferences.tightly_packed)/10;
            fitness = fitness + ((14-((times(1)-800)/100)) * preferences.morning_classes)/10;
            fitness = fitness + (((times(1)-800)/100) * (10-preferences.morning_classes))/10;

        end    
    end 
    
    for i = 1:size(preferences.no_classes)
        time = mapObj(char(preferences.no_classes(i)));
        if time(3) == 0
            fitness = fitness + 10;
        end    
    end    
    
end

