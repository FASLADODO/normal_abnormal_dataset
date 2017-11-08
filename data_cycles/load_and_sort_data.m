% % function to plot all the sequences as they are for each person:
% % first, get all the covariance matrices and save them for the test
% train=load('final_for_train_covariance.mat');
% train=train.final_for_test_covariance;
% persons=fieldnames(train);
% num_persons=numel(persons);
% feature_for_train = [];
% for ii=1:num_persons
% %for each person
%     person=train.(persons{ii});
%     for j=1:size(person,2)
%         data=person{j};
%         %PlotData(data);
%         
%         data=reshape(data{1}, 1, 27*27); % feature vector used for training
%         feature_for_train=[feature_for_train; data];
%     end
% end
% %% 
% function to get all the testing data separately
train=load('Covariance_test.mat');
train=train.final_for_test_covariance;
persons=fieldnames(train);
num_persons=numel(persons);
feature_for_test = [];
feature_for_testLFD=[];
feature_for_testLKI=[];
feature_for_testRFD=[];
feature_for_testRKI=[];


for ii=1:num_persons
%for each person
    person=train.(persons{ii});
    disfucntions=size(person,2);
    for k=1:disfucntions
        
    disf=person{k};
        for j=1:size(disf,2)
             data=disf{j};
                %PlotData(data);
              data=reshape(data, 1, 27*27); % feature vector used for training
              
              switch k
                  case 1 %'LFD'
                       feature_for_testLFD=[feature_for_testLFD; data];
                  case 2% 'LKI'
                        feature_for_testLKI=[ feature_for_testLKI; data];
                  case 3 %'normal'
                      feature_for_test=[feature_for_test; data];
                  case 4 %'RFD'
                      feature_for_testRFD=[feature_for_testRFD; data];
                  case 5% 'RKI'
                    feature_for_testRKI=[feature_for_testRKI; data];  
                  
                
              
        end
    end
    end
end