% main experiment
% load data
train=load('normal_evaluation/Training.mat')
train=train.data_save;
persons=fieldnames(train);
num_persons=numel(persons);
%final_for_test=struct;
for ii=1:num_persons
%for each person
    person=train.(persons{ii});
   % save_str={};
    for j=1:size(person,2)
        data=person{j};
       % PlotData(data);
        data=L_or_Right_sequence(data);
       % PlotData(data);
  %     covMat=MakeCovarianceMatrix(data);
   %    save_str{j}=covMat;
    end
%[final_for_test.(persons{ii})]=save_str;
    
end
