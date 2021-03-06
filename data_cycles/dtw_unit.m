% dtw unit test
%Use dynamic time warping to align the signals such that the sum of the Euclidean distances between their points is smallest. Display the aligned signals and the distance.

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
 [Dist,D,k,w] = dtw(x,y);
 
 % plot alignment
 y_aligned=y(flipud(w(:,2)));
 x_aligned=x(flipud(w(:,1)));
figure
plot(x_aligned, '-ob')
hold on
plot(y_aligned,'-*r')
hold off