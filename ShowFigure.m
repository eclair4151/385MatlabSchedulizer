% CS385 - Final Project
% David Monteleone, Tomer Shemesh, Kelly Shiptoski

% This function places the schedule data into the GUI table
function data = ShowFigure( classes, t )

onlineIndex = 1;
keySet =   {'M', 'T', 'W', 'R','F','S'};
valueSet = 1:6;
mapObj = containers.Map(keySet,valueSet);
data = cell(24,7);
% Place each class in needed column and row
for i=1:size(classes)
    if strcmp(classes{i}.instruction_method, 'Online')
        data{onlineIndex,7} = classes{i}.class_id;
        onlineIndex = onlineIndex +1;
    else  
        class_str = strsplit(classes{i}.days_time_string,' ');
        days = num2cell(char(class_str(1)));
        class_begin = datetime((datenum(classes{i}.begin_time,'yyyy-mm-ddTHH:MM:SS.FFF-05:00')), 'ConvertFrom', 'datenum');
        class_end = datetime((datenum(classes{i}.end_time,'yyyy-mm-ddTHH:MM:SS.FFF-05:00')), 'ConvertFrom', 'datenum');
        beg = (class_begin.Hour-7)*2 -1;
        if class_begin.Minute == 30
            beg = beg +1;
        end    
        classend = (class_end.Hour-7)*2;
        if class_end.Minute == 20
            classend = classend - 1;
        end    
        for j=1:size(days,2)
            for k=beg:classend
                data{k,mapObj(char(days(j)))} = classes{i}.class_id;
            end 
        end    
  
    end    
     
end

% Set data in table
t.Data = data;
end

