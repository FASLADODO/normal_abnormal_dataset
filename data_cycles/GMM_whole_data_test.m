% GMM for the whole thing
data_train=load('final_data_for_train_test/train_for_model.mat');
data_train=data_train.train_for_model;
[J D]=size(data_train);
%% possible normalization of the data
joint_1=data_train(1:3,:);
joint_2=data_train(4:6,:);
joint_3=data_train(7:9,:);
joint_4=data_train(10:12,:);
joint_5=data_train(13:15,:);
joint_6=data_train(16:18,:);
joint_7=data_train(19:21,:);
joint_8=data_train(22:24,:);
joint_9=data_train(25:27,:);
joint_1=reshape(joint_1, 3, D);
joint_2=reshape(joint_2, 3, D);
joint_3=reshape(joint_3, 3, D);
joint_4=reshape(joint_4, 3, D);
joint_5=reshape(joint_5, 3, D);
joint_6=reshape(joint_6, 3, D);
joint_7=reshape(joint_7, 3, D);
joint_8=reshape(joint_8, 3, D);
joint_9=reshape(joint_9, 3, D);
%%
mu=zeros(3,9);
mu_1=mean(joint_1,2);
XYZ=reshape(data_train, 3, D*9)';
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
% 
 