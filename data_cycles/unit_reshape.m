% unit test reshape
% simply reshape the signal for the time dimension equal to 50 frames

train=load('final_for_test.mat');
train=train.final_for_test;
persons=fieldnames(train);
num_persons=numel(persons);

data=train.alex{1,1}{1,1};

[N T]=size(data);
            %reshape the data to shape 25xT, where T - number of frames
             joints_data=reshape(data', 75, N/25);
             [ign t]=size(joints_data);
             left_feet_joints= joints_data([14*3+1:14*3+3, 12*3+1:12*3+3, 13*3+1:13*3+3, 15*3+1:15*3+3],:);
x=(left_feet_joints(3,:));    
data=train.javi{1,1}{1,1};        
[N T]=size(data);
            %reshape the data to shape 25xT, where T - number of frames
             joints_data=reshape(data', 75, N/25);
             [ign t]=size(joints_data);
             left_feet_joints= joints_data([14*3+1:14*3+3, 12*3+1:12*3+3, 13*3+1:13*3+3, 15*3+1:15*3+3],:);
y=(left_feet_joints(3,:));
             %%
             
figure
plot(x, '-ob')
hold on
plot(y,'-*r')
hold off


% reshaping
coeff_res=50;
coeff_data=size(y,2);
y_res = resample(y,coeff_res,coeff_data);
coeff_data=size(x,2);
x_res = resample(x,coeff_res,coeff_data);

figure
plot(x_res, '-ob')
hold on
plot(y_res,'-*r')
hold off
