% simple feature test which takes different characteristics of the curves
% and  makes a feature based on them
% MM and gaussian unit test
% for 5 key positions
data_train=load('final_data_for_train_test/train_for_model_2.mat');
data_train=data_train.train_for_model;
[J D]=size(data_train);
%% possible normalization of the data
j=1;
for h=1:50:D

   normalized = featureNormalize(data_train(3:3:end, h:h+49)')';
   % get the max and mean
   min_val(j,:)=min(normalized,[],2); % min
   max_val(j,:)=max(normalized,[],2); % max
   mean_val(j,:)=mean([max_val(j,:),min_val(j,:)]);
   [~,I] = min(abs(bsxfun(@minus,abs(normalized),abs(mean_val(j,:))')),[],2); % value closest to amplitude min/max
   center(j,:)=I./50;
   normalized_data(1:9,h:h+49)=normalized;
   j=j+1;
end

% feature will have 3 x 27 dimensions, where 27 is the number of joints
% and 5 is the dimensionality of our feature: min value, max value,
% percent for the step duration (should be around 0.5 for normal)

% find the Mu and std for the calculated features
mu_min=mean(min_val, 1);
sigma_min=var(min_val, 1);
mu_max=mean(max_val, 1);
sigma_max=var(max_val, 1);
mu_center=mean(center,1);
sigma_center=var(center,1);

%% 

% normal data for test

% test on the normal set
normal=load('final_data_for_train_test/test_normal_2.mat');
normal=normal.train_for_model_normal;
[N T]=size(normal);
nS=T/50;
%number of sequences

clear min_val max_val center

fits=[];
   j=1;
for i=1:50:T
 
    data_seq=normal(3:3:end,i:i+49);
    data_seq = featureNormalize(data_seq')';
     min_val(j,:)=min( data_seq,[],2); % min
     max_val(j,:)=max( data_seq,[],2); % max
     mean_val(j,:)=mean([max_val(j,:),min_val(j,:)]);
    [~,I] = min(abs(bsxfun(@minus,abs(data_seq),abs(mean_val(j,:))')),[],2); % value closest to amplitude min/max
   center(j,:)=I./50;
    % check if belongs to a given distribution
    d_min(j,:)=abs(mu_min-min_val(j,:)) < sigma_min*2;
    d_max(j,:)=abs(mu_max-max_val(j,:)) < sigma_max*2;
    d_center(j,:)=abs(mu_center-center(j,:)) < sigma_center*2;
    j=j+1;
 


end







