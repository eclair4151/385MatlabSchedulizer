
classes = cell(7,2);
classes{1,1} = 'econ201';
classes{1,2} = 'Lecture';

classes{2,1} = 'engr102';
classes{2,2} = 'Lecture';

classes{3,1} = 'engr102';
classes{3,2} = 'Lab';

classes{4,1} = 'cs283';
classes{4,2} = 'Lecture';

classes{5,1} = 'chem102';
classes{5,2} = 'Lecture';

classes{6,1} = 'chem102';
classes{6,2} = 'Lab';

classes{7,1} = 'chem102';
classes{7,2} = 'Recitation/Discussion';

preferences = struct();
preferences.online_classes = 10;
preferences.tightly_packed = 10;
preferences.morning_classes = 0;
preferences.no_classes = ['W']; %#ok<NBRAK>

all_classes = DownloadClasses(classes);

schedules = cell(1700,2);


index = 1;
for i=1:10
     class = GenerateSchedule(all_classes);
     fitness = GetFitness(class,preferences);
    if IsUnique(fitness,schedules)
        schedules{index,1} = class;
        schedules{index,2} = fitness;
        index = index +1;
    end    
end



statArray = zeros(1,100);


for i=1:100
    [x indexSorted] = sort([schedules{:,2}],'descend');
    schedules = schedules(indexSorted,:);
    fprintf('%i %f\n',i,schedules{1,2});
    statArray(i) = schedules{1,2};
    breeds = 3;
    
    for j=1:2:(breeds*2)
        child = CrossBreed(schedules{j,1}, schedules{j+1,1},all_classes,preferences);
        fitness = GetFitness(child,preferences);
    
        if IsUnique(fitness, schedules)
            schedules{index,1} = child;
            schedules{index,2} = fitness;
            index = index +1;
        end  
    end
     
end    

plot(1:100,statArray);
xlabel('Generation');
ylabel('Best Fitness Value');


f = figure('Position', [100, 100, 620, 580]);
cnames = {'Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Online'};
rnames = {'8:00am','8:30am','9:00am','9:30am','10:00am','10:30am','11:00am','11:30am','12:00pm','12:30pm','1:00pm','1:30pm','2:00pm','2:30pm','3:00pm','3:30pm','4:00pm','4:30pm','5:00pm','5:30pm','6:00pm','6:30pm','7:00pm','7:30pm','8:00pm','8:30pm','9:00pm','9:30pm','10:00pm'};
t = uitable(f,'ColumnName',cnames,'RowName',rnames, 'Data', data,'Position',[0 0 620 580]);
ShowFigure(schedules{1,1}, t);




%sc = schedules{1,1}
%fitness = schedules{1,2}

