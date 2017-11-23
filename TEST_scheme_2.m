% main experiment
% load data
train=load('normal_evaluation/training.mat')
train=train.data_save;
persons=fieldnames(train);
num_persons=numel(persons);
final_for_train=struct;

for ii=4:7 % only the training data
%for each person
    person=train.(persons{ii});
    save_str={};
    for j=1:size(person,2)
        data=person{j};
        data=manual_segmentation(data);
        if isempty(data{1}) || (size(data{1},2)==1)
        continue;
        end
        %PlotData(data);
       save_str{j}=data;
    end
[final_for_train.(persons{ii})]=save_str;
end

