
classes = cell(4,2);
classes{1,1} = 'econ201';
classes{1,2} = 'Lecture';

classes{2,1} = 'cs432';
classes{2,2} = 'Lecture';

classes{3,1} = 'cs283';
classes{3,2} = 'Lecture';

classes{4,1} = 'chem102';
classes{4,2} = 'Lecture';


all_classes = DownloadClasses(classes);

schedules = cell(100,1);
for i=1:100
    schedules{i} = GenerateSchedule(all_classes);
end
