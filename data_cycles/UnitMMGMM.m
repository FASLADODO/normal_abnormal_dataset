% MM and gaussian unit test
% for 5 key positions
data_train=load('final_data_for_train_test/train_for_model.mat');
data_train=data_train.train_for_model;
[N T]=size(data_train);
nS=T/50;
%number of sequences
state=zeros(9,nS*10);
GMM_state={};
model=1;
for i=3:10:48
    h=1;
    for j=1:50:T % for all sequences
    state(:,h:h+9)=data_train(3:3:N,[j+(10*(model-1)):j+(10*(model-1))+9]);
    % plot the selection
    % GMM to learn the data
    h=h+10;
    end 

    obj = fitgmdist(state',9);
    GMM_state{model}=obj;
    model=model+1;
end


% example on how to  generate random data by this model 
% X = random(GMM_state{1},1000);


%% 
 % test new data to check if the model fits the new data and what is the
 % probability of the data being generated by this model

 
 % using the ML algo
% http://people.csail.mit.edu/dsontag/courses/ml12/slides/lecture21.pdf

% Posterior
%y = y + obj.PComponents(j) * mvncdf(X,obj.mu(j,:),obj.Sigma(:,:,j));
 
%pr = posterior(GMM_state{1}, state(:,1)');
% if there is a model which fits with more than 95 % accuracy, it is fine



% test on the normal set
normal=load('final_data_for_train_test/test_normal.mat');
normal=normal.train_for_model_normal;
[N T]=size(normal);
nS=T/50;
%number of sequences


for i=1:50:T
    data_seq=normal(3:3:N,i:i+49);
        for j=1:10:50
            state=data_seq(:,j:j+9);
            state=mean(state');
            pr = posterior(GMM_state{1}, state);
        end


end


%% abnormal LKI
LKI=load('final_data_for_train_test/test_LKI.mat');
LKI=LKI.train_for_model_LKI;
[N T]=size(LKI);
nS=T/50;
%number of sequences


for i=1:50:T
    data_seq=LKI(3:3:N,i:i+49);
        for j=1:10:50
            state=data_seq(:,j:j+9);
            state=mean(state,2);
            pr = posterior(GMM_state{1}, state')
        end


end



