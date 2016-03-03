
classes = cell(4,2);
classes{1,1} = 'econ201';
classes{1,2} = 'Lecture';

classes{2,1} = 'cs432';
classes{2,2} = 'Lecture';

classes{3,1} = 'cs283';
classes{3,2} = 'Lecture';

classes{4,1} = 'chem102';
classes{4,2} = 'Lecture';

preferences = struct();
preferences.online_classes = 10;
preferences.tightly_packed = 10;
preferences.morning_classes = 1;
preferences.no_classes = ['M']; %#ok<NBRAK>


all_classes = DownloadClasses(classes);


schedules = cell(100,2);
for i=1:100
    schedules{i,1} = GenerateSchedule(all_classes);
    schedules{i,2} = GetFitness(schedules{i},preferences);
end


[x indexSorted] = sort([schedules{:,2}],'descend');
schedules = schedules(indexSorted,:);

sc = schedules{1,1}
fitness = schedules{1,2}

