% test simple features relative postion
% simple feature test which takes different characteristics of the curves
% and  makes a feature based on them
% MM and gaussian unit test
% for 5 key positions
clc
clear all
data_train=load('final_data_for_train_test/train_for_model_2.mat');
data_train=data_train.train_for_model;
[J D]=size(data_train);
%% possible normalization of the data

figure(1)
hold on
figure (2)
hold on
figure (3)
hold on
for h=1:50:D

   normalized = featureNormalize(data_train(:, h:h+49)')';
  % get the max and mean
  %normalized=data_train(:, h:h+49);
  normalized_data(1:27,h:h+49)=normalized;
  dist=zeros(1,50);
  for i=1:50
      c=pdist([normalized(1,i),normalized(2,i), normalized(3,i);normalized(4,i),normalized(5,i),normalized(6,i)],'euclidean');
      a=pdist([normalized(1,i),normalized(2,i), normalized(3,i);normalized(7,i),normalized(8,i),normalized(9,i)],'euclidean');
      b=pdist([normalized(4,i),normalized(5,i), normalized(6,i);normalized(7,i),normalized(8,i),normalized(9,i)],'euclidean');
      angle_1(i)=acos((a^2+b^2-c^2)/(2*a*b));
      c=pdist([normalized(25,i),normalized(26,i), normalized(27,i);normalized(22,i),normalized(23,i),normalized(24,i)],'euclidean');
      a=pdist([normalized(25,i),normalized(26,i), normalized(27,i);normalized(19,i),normalized(20,i),normalized(21,i)],'euclidean');
      b=pdist([normalized(22,i),normalized(23,i), normalized(24,i);normalized(19,i),normalized(20,i),normalized(21,i)],'euclidean');
      angler_1(i)=acos((a^2+b^2-c^2)/(2*a*b));
      %figure(3)
      %[normalized(10,i),normalized(11,i), normalized(12,i);normalized(16,i),normalized(17,i),normalized(18,i)]
      %[normalized(7,i),normalized(8,i), normalized(9,i);normalized(19,i),normalized(20,i),normalized(21,i)]
      %scatter3([normalized(1,i),normalized(25,i)], [normalized(2,i),normalized(26,i)], [normalized(3,i),normalized(27,i)], '.', 'b');
     % ankle hip knee 
  end     
  figure(1)
   plot(angle_1,'r');
   figure(2)
   plot(normalized(3,:),'r');
figure(3)
plot(angler_1,'r');
end
clear normalized
%%
%% abnormal LKI
figure(1)
hold on
LKI=load('final_data_for_train_test/test_normal_2.mat');
LKI=LKI.train_for_model_normal;
[N T]=size(LKI);
nS=T/50;
%number of sequences

for h=1:50:T

   normalized = featureNormalize(LKI(:, h:h+49)')';
   % get the max and mean
   %normalized=LKI(:, h:h+49);
   normalized_data_LKI(1:27,h:h+49)=normalized;
 dist=zeros(1,50);
  for i=1:50
      c=pdist([normalized(1,i),normalized(2,i), normalized(3,i);normalized(4,i),normalized(5,i),normalized(6,i)],'euclidean');
      a=pdist([normalized(1,i),normalized(2,i), normalized(3,i);normalized(7,i),normalized(8,i),normalized(9,i)],'euclidean');
      b=pdist([normalized(4,i),normalized(5,i), normalized(6,i);normalized(7,i),normalized(8,i),normalized(9,i)],'euclidean');
      angle(i)=acos((a^2+b^2-c^2)/(2*a*b));
       c=pdist([normalized(25,i),normalized(26,i), normalized(27,i);normalized(22,i),normalized(23,i),normalized(24,i)],'euclidean');
      a=pdist([normalized(25,i),normalized(26,i), normalized(27,i);normalized(19,i),normalized(20,i),normalized(21,i)],'euclidean');
      b=pdist([normalized(22,i),normalized(23,i), normalized(24,i);normalized(19,i),normalized(20,i),normalized(21,i)],'euclidean');
      angler(i)=acos((a^2+b^2-c^2)/(2*a*b));
      
      %([normalized(7,i),normalized(8,i), normalized(9,i);normalized(19,i),normalized(20,i),normalized(21,i)],'euclidean');
      figure(1)
      %figure(3)
     % scatter3([normalized(1,i),normalized(25,i)], [normalized(2,i),normalized(26,i)], [normalized(3,i),normalized(27,i)], 'r');
  end  
  figure(1)
   plot(angle,'b');
  figure(2)
   plot(normalized(3,:),'b');
    figure(3)
   plot(angler,'b');
   figure(4)
   hold on
   plot(angle./angler,'b');
    plot(angle_1./angler_1, 'r');
end
