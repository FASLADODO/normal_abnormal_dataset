data_train=load('angles_data/Angles_normal.mat');
data_train=data_train.Angles_normal;
[N T]=size(data_train);
sample=zeros(4,50);
for h=1:50:T
        sample=sample+data_train(:, h:h+49);  
end
sample=sample./(T/50);
plot(sample');



% test on the normal set
normal=load('angles_data/Angles_normal_test.mat');
normal=normal.Angles_normal_test;
[N T]=size(normal);
M=1;
for h=1:50:T
        normalized=normal(:, h:h+49);  
        for k=1:4
        D(k,M)=pdist2(sample(k,:),normalized(k,:),'minkowski');
        end
               M=M+1;
        end
 M

%% abnormal LKI
LKI=load('angles_data/Angles_LFD.mat');
LKI=LKI.Angles_LFD;
[N T]=size(LKI);

for i=1:50:T
    data_seq=LKI(:,i:i+49);
    for k=1:4
        D(k,M)=pdist2(sample(k,:),data_seq(k,:),'minkowski');
     
    end
       M=M+1;
end

%%
M

%% abnormal RKI
LKI=load('angles_data/Angles_RKI.mat');
LKI=LKI.Angles_RKI;
[N T]=size(LKI);

for i=1:50:T
    data_seq=LKI(:,i:i+49);
    for k=1:4
        D(k,M)=pdist2(sample(k,:),data_seq(k,:),'minkowski');
     
    end
       M=M+1;
end
M
%% abnormal LFD
LKI=load('angles_data/Angles_LFD.mat');
LKI=LKI.Angles_LFD;
[N T]=size(LKI);

for i=1:50:T
    data_seq=LKI(:,i:i+49);
    for k=1:4
        D(k,M)=pdist2(sample(k,:),data_seq(k,:),'minkowski');
     
    end
       M=M+1;
end

%% abnormal RFD
LKI=load('angles_data/Angles_RFD.mat');
LKI=LKI.Angles_RFD;
[N T]=size(LKI);

for i=1:50:T
    data_seq=LKI(:,i:i+49);
    for k=1:4
        D(k,M)=pdist2(sample(k,:),data_seq(k,:),'minkowski');
     
    end
       M=M+1;
end
