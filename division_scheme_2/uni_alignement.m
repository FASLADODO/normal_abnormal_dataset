% alignment unit
data_train=load('Train_norm.mat');
data_train=data_train.Train_norm;
model=data_train{9};
s2=model(3,:);
s2=featureNormalize(s2);
normalized=data_train{1};
  s1=normalized(3,:);
  s1=featureNormalize(s1);
  figure(11)
  hold on
  plot(s1)
  plot(s2);
  
  %% alignment
  
[x1,x2] = alignsignals(s1,s2);

subplot(2,1,1)
stem(x1)
xlim([0 mx+1])

subplot(2,1,2)
stem(x2,'*')
xlim([0 mx+1])