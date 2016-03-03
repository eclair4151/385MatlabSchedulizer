function all_classes = DownloadClasses( classes )
%DOWNLOADCLASSES Summary of this function goes here
%   Detailed explanation goes here

term = 'Winter';
term_type = 'Quarter';
term_year = '15-16';
url = 'http://107.170.133.244/api/v1/search_webtms';
options = weboptions('MediaType','application/json');

all_classes = cell(size(classes,1));

for i= 1:size(classes)
    data = struct();
    data.term = term;
    data.term_type = term_type;
    data.term_year = term_year;
    data.classid = classes{i,1};
    %data.days = {'Monday','Tuesday'};
    data.instruction_types = {classes{i,2}};
    response = webwrite(url,data,options);
    all_classes{i} =  response;
end    


end

