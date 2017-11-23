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
for i=2:numel(Train_normal)
    data=Train_normal{i};
    for j=1:4
    y=data(j,:);
    x=Model(j,:);
    
    [Dist,D,k,w] = dtw(y, x);
  
    % plot alignment
    figure(j)
  %  y_aligned=y(flipud(w(:,2)));
    x_aligned=x(flipud(w(:,1)));
    plot(x_aligned);
    
    end
end