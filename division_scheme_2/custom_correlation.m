data_train=load('Train_norm.mat');
data_train=data_train.Train_norm;
model=data_train{5};
s2=model(3,:);
s2=featureNormalize(s2);
coeff_data=size( s1,2);
coeff_res=30;
s1 = (resample( s1,coeff_res,coeff_data))';
s2 = (resample( s2,coeff_res,size( s2,2)))';
  
normalized=data_train{1};
  s1=normalized(3,:);
  s1=featureNormalize(s1);
  figure(11)
  hold on
  plot(s1)
  plot(s2);

X1=xcorr(s1,s2);   %compute cross-correlation between vectors s1 and s2
[m,d]=max(X1);      %find value and index of maximum value of cross-correlation amplitude
delay=d-max(length(s1),length(s2));   %shift index d, as length(X1)=2*N-1; where N is the length of the signals
figure,plot(s1)                                     %Plot signal s1
hold,plot([delay+1:length(s2)+delay],s2,'r');   %Delay signal s2 by delay in order to align 
