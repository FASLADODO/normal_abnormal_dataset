% GMM for the whole thing
data_train=load('final_data_for_train_test/train_for_model.mat');
data_train=data_train.train_for_model;
[J D]=size(data_train);
% normalization
% for h=1:50:D
% 
%    normalized = featureNormalize(data_train(:, h:h+49)')';
%    % get the max and mean
%    normalized_data(1:27,h:h+49)=normalized;
% 
% end
normalized_data=data_train;
XYZ=reshape(data_train, 3, D*9)';
%normalized_data=data_train;
%% possible normalization of the data
joint_1=normalized_data(1:3,:);
joint_2=normalized_data(4:6,:);
joint_3=normalized_data(7:9,:);
joint_4=normalized_data(10:12,:);
joint_5=normalized_data(13:15,:);
joint_6=normalized_data(16:18,:);
joint_7=normalized_data(19:21,:);
joint_8=normalized_data(22:24,:);
joint_9=normalized_data(25:27,:);
% joint_1=normalized_data(joint_1, 3, D);
% joint_2=normalized_data(joint_2, 3, D);
% joint_3=normalized_data(joint_3, 3, D);
% joint_4=normalized_data(joint_4, 3, D);
% joint_5=normalized_data(joint_5, 3, D);
% joint_6=normalized_data(joint_6, 3, D);
% joint_7=normalized_data(joint_7, 3, D);
% joint_8=normalized_data(joint_8, 3, D);
% joint_9=normalized_data(joint_9, 3, D);
%%
mu=zeros(3,9);
Sigma=zeros(3,3,9);
mu_1=mean(joint_1,2);
var_1=cov(joint_1');
Sigma(:,:,1)=var_1;
Mu(1,:)=mu_1;
mu_2=mean(joint_2,2);
Mu(2,:)=mu_2;
var_2=cov(joint_2');
Sigma(:,:,2)=var_2;
mu_3=mean(joint_3,2);
Mu(3,:)=mu_3;
var_3=cov(joint_3');
Sigma(:,:,3)=var_3;
mu_4=mean(joint_4,2);
Mu(4,:)=mu_4;
var_4=cov(joint_4');
Sigma(:,:,4)=var_4;
mu_5=mean(joint_5,2);
Mu(5,:)=mu_5;
var_5=cov(joint_5');
Sigma(:,:,5)=var_5;
mu_6=mean(joint_6,2);
Mu(6,:)=mu_6;
var_6=cov(joint_6');
Sigma(:,:,6)=var_6;
mu_7=mean(joint_7,2);
Mu(7,:)=mu_7;
var_7=cov(joint_7');
Sigma(:,:,7)=var_7;
mu_8=mean(joint_8,2);
Mu(8,:)=mu_8;
var_8=cov(joint_8');
Sigma(:,:,8)=var_8;
mu_9=mean(joint_9,2);
Mu(9,:)=mu_9;
var_9=cov(joint_9');
Sigma(:,:,9)=var_9;

% XYZ=reshape(normalized_data, 3, D*9)';
% figure(1)
% grid on
% hold on
% customColorMap = zeros(9, 3); % Initialize.
% % Make the first 10 points red
% customColorMap(1:1, :) = repmat([1, 0, 0], 1, 1);
% % Make the next 10 points dark green
% customColorMap(2:2, :) = repmat([0, 0.6, 0], 1, 1);
% customColorMap(3:3, :) = repmat([0.1, 0.2, 0], 1, 1);
% customColorMap(4:4, :) = repmat([0, 0.0, 1], 1, 1);
% customColorMap(5:5, :) = repmat([0, 2, 0], 1, 1);
% customColorMap(6:6, :) = repmat([0, 0, 0.5], 1, 1);
% customColorMap(7:7, :) = repmat([0.8, 0.2, 0], 1, 1);
% customColorMap(8:8, :) = repmat([0.4, 0, 0.4], 1, 1);
% % Make the remaining points blue
% customColorMap(9:end, :) = repmat([0, 1, 0], 1, 1);
% for i=1:9:size(XYZ)
%     XYZ=reshape(data_train, 3, D*9)';
% figure(1)
%     scatter3(XYZ(i:i+8, 1), XYZ(i:i+8, 2),XYZ(i:i+8,3), 5, customColorMap,'filled');
% end
% % % % 
% % 
%%
% test normal calculate probability for each sequence
normal=load('final_data_for_train_test/test_normal.mat');
normal=normal.train_for_model_normal;
[N T]=size(normal);
nS=T/50;
Final_probabilities = cell(nS,1);
l=1;
figure(5)
hold on;
for h=1:50:T

 %  normalized = featureNormalize(normal(:, h:h+49)')';
   % get the max and mean
   joint=1;
   pdf_data=zeros(9, 50);
   normalized= normal(:, h:h+49);
   for m=1:3:27
       for k=1:50
       pdf_data(joint,k) = mvncdf(normalized(m:m+2,k)',Mu(joint,:), Sigma(:,:,joint));
       end
   joint=joint+1;    
   end
   figure(5);
   plot(pdf_data','r');
   Final_probabilities{l,1}=pdf_data;
   l=l+1;
end

l
%% test data
LKI=load('final_data_for_train_test/test_RFD.mat');
LKI=LKI.train_for_model_RFD;
[N T]=size(LKI);
nS=T/50;
%number of sequences
NameArray = {'LineStyle'};
ValueArray = { '-.'};
for h=1:50:T
   joint=1;
   pdf_data=zeros(9, 50);
   %normalized = featureNormalize(LKI(:, h:h+49)')';
   % get the max and mean
   normalized=LKI(:, h:h+49);
   for m=1:3:27
       for k=1:50
       pdf_data(joint,k) = mvncdf(normalized(m:m+2,k)',Mu(joint,:), Sigma(:,:,joint));
       end
       joint=joint+1;    
   end
   figure(5);
   plot(pdf_data','b');
   Final_probabilities{l,1}=pdf_data;
   l=l+1;
end
   
%%
% check by plotting for different joints
figure(4)
hold on

for k=1:26
    if k<18
        figure(4)
        plot(Final_probabilities{k,1}(1,:),'r');
        P(k)=min(min(Final_probabilities{k,1}'))
    else
        figure(4)
        plot(Final_probabilities{k,1}(1,:),'b');
        P(k)=min(min(Final_probabilities{k,1}'))
    end
end
        
