% final model creation and test

Train_normal=load('angles/Angles_LFD_test');
Train_normal=Train_normal.Angles_normal;
Model = Train_normal{1};
normalized{1}=[zeros(4,abs(0)),Model];
figure(1)
hold on
figure(2)
hold on

figure(3)
hold on

figure(4)

hold on
figure(1)
plot(normalized{1}(1,:),'-*b');
figure(2)
plot(normalized{1}(2,:),'-*b');
figure(3)
plot(normalized{1}(3,:),'-*b');
figure(4)
plot(normalized{1}(4,:),'-*b');


for i=2:numel(Train_normal)
    data=Train_normal{i};
    
    if isempty(data)
        continue
    end
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
figure(1)
plot(normalized{i}(1,:),'-*r');
figure(2)
plot(normalized{i}(2,:),'-*r');
figure(3)
plot(normalized{i}(3,:),'-*r');
figure(4)
plot(normalized{i}(4,:),'-*r');
pause();
end