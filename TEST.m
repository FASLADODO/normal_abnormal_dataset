% main experiment
% load data
train=load('normal_evaluation/training.mat')
train=train.data_save;
persons=fieldnames(train);
num_persons=numel(persons);
final_for_test=struct;
final_for_test_covariance=struct;
for ii=1:num_persons
%for each person
    person=train.(persons{ii});
    save_str={};
    save_str_cov={};
    for j=1:size(person,2)
        data=person{j};
        data=L_or_Right_sequence(data);
        if isempty(data{1}) || (size(data{1},2)==1)
        continue;
        end
        %PlotData(data);
       covMat=MakeCovarianceMatrix(data);
       save_str_cov{j}=covMat;
       save_str{j}=data;
    end
[final_for_test.(persons{ii})]=save_str;
[final_for_test_covariance.(persons{ii})]=save_str_cov;  
end

