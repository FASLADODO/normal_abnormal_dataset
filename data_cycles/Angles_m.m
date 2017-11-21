% test simple features relative postion
% simple feature test which takes different characteristics of the curves
% and  makes a feature based on them
% MM and gaussian unit test
% for 5 key positions
clc
clear all
close all
data_train=load('final_data_for_train_test/train_whole.mat');
data_train=data_train.train_for_model;
[J D]=size(data_train);
%% possible normalization of the data

figure(1)
hold on
figure (2)
hold on
figure (3)
hold on
figure (4)
hold on
figure (5)
hold on
Angles_normal=zeros(4,D);
for h=1:50:D

  %  normalized = featureNormalize(data_train(:, h:h+49)')';
  % get the max and mean
  normalized=data_train(:, h:h+49);
  %normalized=Normalize_between_0_and_1(data_train(:, h:h+49));
  normalized_data(1:27,h:h+49)=normalized;
  dist=zeros(1,50);
  for i=1:50
      a=([normalized(7,i),normalized(8,i),normalized(9,i)]-[normalized(1,i),normalized(2,i), normalized(3,i)]);
      b=([normalized(7,i),normalized(8,i),normalized(9,i)]-[normalized(4,i),normalized(5,i), normalized(6,i)]);
      angle_1(i)=atan2d(norm(cross(a,b)),dot(a,b));
      c=([normalized(19,i),normalized(20,i),normalized(21,i)]-[normalized(25,i),normalized(26,i), normalized(27,i)]);
      d=([normalized(19,i),normalized(20,i),normalized(21,i)]-[normalized(22,i),normalized(23,i), normalized(24,i)]);
%       c=pdist([normalized(25,i),normalized(26,i), normalized(27,i);normalized(22,i),normalized(23,i),normalized(24,i)],'euclidean');
%       a=pdist([normalized(25,i),normalized(26,i), normalized(27,i);normalized(19,i),normalized(20,i),normalized(21,i)],'euclidean');
%       b=pdist([normalized(22,i),normalized(23,i), normalized(24,i);normalized(19,i),normalized(20,i),normalized(21,i)],'euclidean');
      angle_1_r(i)=atan2d(norm(cross(c,d)),dot(c,d));
      %figure(3)
      %[normalized(10,i),normalized(11,i), normalized(12,i);normalized(16,i),normalized(17,i),normalized(18,i)]
      %[normalized(7,i),normalized(8,i), normalized(9,i);normalized(19,i),normalized(20,i),normalized(21,i)]
      %scatter3([normalized(1,i),normalized(25,i)], [normalized(2,i),normalized(26,i)], [normalized(3,i),normalized(27,i)], '.', 'b');
     % ankle hip knee 
      a=([normalized(4,i),normalized(5,i),normalized(6,i)]-[normalized(7,i),normalized(8,i), normalized(9,i)]);
      b=([normalized(4,i),normalized(5,i),normalized(6,i)]-[normalized(1,i),normalized(2,i), normalized(3,i)]);
      angle_1_H(i)=atan2d(norm(cross(a,b)),dot(a,b));
     
      c=([normalized(22,i),normalized(23,i), normalized(24,i)]-[normalized(19,i),normalized(20,i),normalized(21,i)]);
      d=([normalized(22,i),normalized(23,i), normalized(24,i)]-[normalized(25,i),normalized(26,i), normalized(27,i)]);
      angle_1_Hr(i)=atan2d(norm(cross(c,d)),dot(c,d));
     
  end     
  figure(1)
   plot(angle_1, '-sr');
   figure(2)
   plot(normalized(27,:),'r');
 figure(3)
 plot(angle_1_r,'-sr');
 figure(4)
 plot(angle_1_H,'-sr'); 
 figure(5)
  plot(angle_1_Hr,'-sr');
  Angles_normal(1,h:h+49)=angle_1;
  Angles_normal(2,h:h+49)=angle_1_r;
  Angles_normal(3,h:h+49)=angle_1_H;
  Angles_normal(4,h:h+49)=angle_1_Hr;
  
  
  
end
clear normalized
%%
%% abnormal LKI
figure(1)
hold on
LKI=load('final_data_for_train_test/test_LKI_2.mat');
LKI=LKI.train_for_model_LKI;
[N T]=size(LKI);
nS=T/50;
%number of sequences
Angles_RKI=zeros(4,T);
for h=1:50:T

   %normalized = featureNormalize(LKI(:, h:h+49)')';
   % get the max and mean
   normalized=LKI(:, h:h+49);
  % normalized=Normalize_between_0_and_1(LKI(:, h:h+49));
   normalized_data_LKI(1:27,h:h+49)=normalized;
 dist=zeros(1,50);
  for i=1:50
      a=([normalized(7,i),normalized(8,i),normalized(9,i)]-[normalized(1,i),normalized(2,i), normalized(3,i)]);
      b=([normalized(7,i),normalized(8,i),normalized(9,i)]-[normalized(4,i),normalized(5,i), normalized(6,i)]);
      angle_2(i)=atan2d(norm(cross(a,b)),dot(a,b));
      c=([normalized(19,i),normalized(20,i),normalized(21,i)]-[normalized(25,i),normalized(26,i), normalized(27,i)]);
      d=([normalized(19,i),normalized(20,i),normalized(21,i)]-[normalized(22,i),normalized(23,i), normalized(24,i)]);
%       c=pdist([normalized(25,i),normalized(26,i), normalized(27,i);normalized(22,i),normalized(23,i),normalized(24,i)],'euclidean');
%       a=pdist([normalized(25,i),normalized(26,i), normalized(27,i);normalized(19,i),normalized(20,i),normalized(21,i)],'euclidean');
%       b=pdist([normalized(22,i),normalized(23,i), normalized(24,i);normalized(19,i),normalized(20,i),normalized(21,i)],'euclidean');
      angle_2_r(i)=atan2d(norm(cross(c,d)),dot(c,d));
      %([normalized(7,i),normalized(8,i), normalized(9,i);normalized(19,i),normalized(20,i),normalized(21,i)],'euclidean');
    
      a=([normalized(4,i),normalized(5,i),normalized(6,i)]-[normalized(7,i),normalized(8,i), normalized(9,i)]);
      b=([normalized(4,i),normalized(5,i),normalized(6,i)]-[normalized(1,i),normalized(2,i), normalized(3,i)]);
      angle_2_H(i)=atan2d(norm(cross(a,b)),dot(a,b));
     
      c=([normalized(22,i),normalized(23,i), normalized(24,i)]-[normalized(19,i),normalized(20,i),normalized(21,i)]);
      d=([normalized(22,i),normalized(23,i), normalized(24,i)]-[normalized(25,i),normalized(26,i), normalized(27,i)]);
      angle_2_Hr(i)=atan2d(norm(cross(c,d)),dot(c,d));
      %figure(3)
     % scatter3([normalized(1,i),normalized(25,i)], [normalized(2,i),normalized(26,i)], [normalized(3,i),normalized(27,i)], 'r');
  end  
  figure(1)
   plot(angle_2,'b');
  figure(2)
   plot(normalized(27,:),'b');
    figure(3)
   plot(angle_2_r,'b');
    figure(4)
 plot(angle_2_H,'b'); 
 figure(5)
  plot(angle_2_Hr,'b');
  
  
  Angles_LKI(1,h:h+49)=angle_2;
  Angles_LKI(2,h:h+49)=angle_2_r;
  Angles_LKI(3,h:h+49)=angle_2_H;
  Angles_LKI(4,h:h+49)=angle_2_Hr;
  
  
end
% figure(4)
%    hold on
%    plot((angle./angler),'b');
%    plot((angle_1./angler_1), 'r');