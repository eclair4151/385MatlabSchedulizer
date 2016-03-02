
classes = cell(4,2);
%classes = ['econ201', 'Lecture'; 'cs432', 'Lecture';  'cs283', 'Lecture';   'chem102', 'Lab'];
classes{1,1} = 'econ201';
classes{1,2} = 'Lecture';

classes{2,1} = 'cs432';
classes{2,2} = 'Lecture';

classes{3,1} = 'cs283';
classes{3,2} = 'Lecture';

classes{4,1} = 'chem102';
classes{4,2} = 'Lecture';


all = DownloadClasses(classes)
