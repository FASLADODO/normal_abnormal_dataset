% main experiment
% load data
train=load('normal_evaluation/Training.mat')
train=train.Training_data;
persons=fieldnames(train);
num_persons=numel(persons);
for ii=1:num_persons
%for each person
    person=train.(persons{ii});
    for j=1:size(person,2)
        data=person{j};
        covMat=MakeCovarianceMatrix(data);
        
    end

end