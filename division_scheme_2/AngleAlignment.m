% final model creation and test

Train_normal=load('angles/Angles_normal_train');
Train_normal=Train_normal.Angles_normal;
Model = Train_normal{1};

figure(1)
hold on
plot(Model(1,:),'-*b');
figure(2)
hold on
plot(Model(2,:),'-*b');
figure(3)
hold on
plot(Model(3,:),'-*b');
figure(4)
plot(Model(4,:),'-*b');
hold on
normalized{1}=Model;
for i=2:numel(Train_normal)
    data=Train_normal{i};
    
    s1=Model(1,:);
    s2=data(1,:);
    %X1=xcorr(s1,s2);   %compute cross-correlation between vectors s1 and s2
    %[m,d]=max(X1);      %find value and index of maximum value of cross-correlation amplitude
    [min_s, l1]=min(s2)
    [min_m, l2]=min(s1)
    delay=l2-l1;   %shift index d, as length(X1)=2*N-1; where N is the length of the signals
    figure,plot(s1)                                     %Plot signal s1
    hold,plot([delay+1:length(s2)+delay],s2,'r');   %Delay signal s2 by delay in order to align 
    if delay>0 
        normalized{i}=[zeros(4,delay), data];
    else
        normalized{i}=[data,zeros(4,abs(delay))];
    end
pause();
end