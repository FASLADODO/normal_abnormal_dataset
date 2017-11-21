% GMM for the whole thing
data_train=load('angles_data/Angles_train.mat');
data_train=data_train.Angles_normal;

% take average value for each 10 frames
[N T]=size(data_train);
nS=T/50;
figure(1)
hold on
data_for_train=[];
%number of sequences
for i=1:50:T
sequence=data_train(:,i:i+49);
resampled_data=[];
    for j=1:10:50
        resampled_data=[resampled_data, mean(sequence(:,j:j+9)')'];
    end
    figure(1)
    plot(resampled_data','*r');
  data_for_train=[data_for_train, reshape(resampled_data, 4*5, 1)];  
end




%% add normal testing data
data_train=load('angles_data/Angles_normal.mat');
data_train=data_train.Angles_normal;

% take average value for each 10 frames
[N T]=size(data_train);
nS=T/50;
figure(1)
hold on
data_for_train_2=[];
%number of sequences
for i=1:50:400
sequence=data_train(:,i:i+49);
resampled_data=[];
    for j=1:10:50
        resampled_data=[resampled_data, mean(sequence(:,j:j+9)')'];
    end
    figure(1)
    plot(resampled_data','*r');
  data_for_train_2=[data_for_train_2, reshape(resampled_data, 4*5, 1)];  
end

%%

data_normal=[data_for_train, data_for_train_2];
Obj=fitgmdist(data_normal',1);
% more data needed to test this one
K=1;
X = random(Obj,K);
figure(1);
X=reshape(X', 4,5); 
plot(X','*b');

X = random(Obj,K);
figure(1);
X=reshape(X', 4,5); 
plot(X','ob');

X = random(Obj,K);
figure(1);
X=reshape(X', 4,5); 
plot(X','oy');
X = random(Obj,K);
figure(1);
X=reshape(X', 4,5); 
plot(X','og');
X = random(Obj,K);
figure(1);
X=reshape(X', 4,5); 
plot(X','*m');
% 
% 
% % test on the normal set
% normal=load('angles_data/Angles_normal.mat');
% normal=normal.train_for_model_normal;
% [N T]=size(normal);
% nS=T/50;
% %number of sequences
% 
% 
% for i=1:50:T
%     data_seq=normal(:,i:i+49);
%     pr = posterior(obj, data_seq');
% 
% end
% 

%% abnormal LKI
LKI=load('angles_data/Angles_LKI.mat');
LKI=LKI.Angles_LKI;
[N T]=size(LKI);
nS=T/50;
%number of sequences
probability_LKI=[];

for i=1:50:T
sequence=LKI(:,i:i+49);
resampled_data=[];
    for j=1:10:50
        resampled_data=[resampled_data, mean(sequence(:,j:j+9)')'];
    end
    
  data_for_train_LKI=[data_for_train_2, reshape(resampled_data, 4*5, 1)];  
 [pr nlogl] = posterior(Obj, reshape(resampled_data, 4*5, 1)');
 probability_LKI=[probability_LKI, nlogl];
end


%%%
%% add normal testing data
data_train=load('angles_data/Angles_normal.mat');
data_train=data_train.Angles_normal;
 probability_normal=[];
% take average value for each 10 frames
[N T]=size(data_train);
nS=T/50;
figure(1)
hold on
data_for_train_normal=[];
%number of sequences
for i=401:50:T
sequence=data_train(:,i:i+49);
resampled_data=[];
    for j=1:10:50
        resampled_data=[resampled_data, mean(sequence(:,j:j+9)')'];
    end
     [pr nlogl] = posterior(Obj, reshape(resampled_data, 4*5, 1)');
    probability_normal=[probability_normal, nlogl];
     data_for_train_normal=[data_for_train_normal, reshape(resampled_data, 4*5, 1)];  
end


%% abnormal RKI
LKI=load('angles_data/Angles_RKI.mat');
LKI=LKI.Angles_RKI;
[N T]=size(LKI);
nS=T/50;
%number of sequences
probability_RKI=[];

for i=1:50:T
sequence=LKI(:,i:i+49);
resampled_data=[];
    for j=1:10:50
        resampled_data=[resampled_data, mean(sequence(:,j:j+9)')'];
    end
    figure(1)
    plot(resampled_data','ko','MarkerSize', 12);
  data_for_train_LKI=[data_for_train_2, reshape(resampled_data, 4*5, 1)];  
 [pr nlogl] = posterior(Obj, reshape(resampled_data, 4*5, 1)');
 probability_RKI=[probability_RKI, nlogl];
end

%%
%% abnormal LFD
LKI=load('angles_data/Angles_LFD.mat');
LKI=LKI.Angles_LFD;
[N T]=size(LKI);
nS=T/50;
%number of sequences
probability_LFD=[];

for i=1:50:T
sequence=LKI(:,i:i+49);
resampled_data=[];
    for j=1:10:50
        resampled_data=[resampled_data, mean(sequence(:,j:j+9)')'];
    end
    figure(1)
    plot(resampled_data','ko','MarkerSize', 12);
  data_for_train_LKI=[data_for_train_2, reshape(resampled_data, 4*5, 1)];  
 [pr nlogl] = posterior(Obj, reshape(resampled_data, 4*5, 1)');
 probability_LFD=[probability_LFD, nlogl];
end


%%
%% abnormal RFD
LKI=load('angles_data/Angles_RFD.mat');
LKI=LKI.Angles_RFD;
[N T]=size(LKI);
nS=T/50;
%number of sequences
probability_RFD=[];

for i=1:50:T
sequence=LKI(:,i:i+49);
resampled_data=[];
    for j=1:10:50
        resampled_data=[resampled_data, mean(sequence(:,j:j+9)')'];
    end
    figure(1)
    plot(resampled_data','ko','MarkerSize', 12);
  data_for_train_LKI=[data_for_train_2, reshape(resampled_data, 4*5, 1)];  
 [pr nlogl] = posterior(Obj, reshape(resampled_data, 4*5, 1)');
 probability_RFD=[probability_RFD, nlogl];
end
