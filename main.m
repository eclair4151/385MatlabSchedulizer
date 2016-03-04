
classes = cell(6,2);
classes{1,1} = 'econ201';
classes{1,2} = 'Lecture';

classes{2,1} = 'cs432';
classes{2,2} = 'Lecture';

classes{3,1} = 'cs283';
classes{3,2} = 'Lecture';

classes{4,1} = 'chem102';
classes{4,2} = 'Lecture';

classes{5,1} = 'chem102';
classes{5,2} = 'Lab';

classes{6,1} = 'chem102';
classes{6,2} = 'Recitation/Discussion';

preferences = struct();
preferences.online_classes = 0;
preferences.tightly_packed = 10;
preferences.morning_classes = 1;
preferences.no_classes = ['F']; %#ok<NBRAK>


all_classes = DownloadClasses(classes);


schedules = cell(1700,2);
index = 1;
for i=1:20
     class = GenerateSchedule(all_classes);
     fitness = GetFitness(class,preferences);
    if IsUnique(fitness,schedules)
        schedules{index,1} = class;
        schedules{index,2} = fitness;
        index = index +1;
    end    
end

for i=1:1000
    [x indexSorted] = sort([schedules{:,2}],'descend');
    schedules = schedules(indexSorted,:);
    fprintf('%i %f\n',i,schedules{1,2});
    
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




%sc = schedules{1,1}
%fitness = schedules{1,2}

