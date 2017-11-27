% % final thing
% feature=zeros(numel(Normal_train),4);
% for j=1:numel(Normal_train)
%     data=Normal_train{j};
%     data( :, ~any(data,1) ) = [];  %columns
%     feature(j,:)=var(data');
% end
% %% 
% feature_LKI=zeros(numel(LKI_train),4)
% for j=1:numel(LKI_train)
%      data=LKI_train{j};
%     data( :, ~any(data,1) ) = [];  %columns
%     feature_LKI(j,:)=var(data');
% end
% 
% %%
% feature_RKI=zeros(numel(RKI_train),4)
% for j=1:numel(RKI_train)
%      data=RKI_train{j};
%     data( :, ~any(data,1) ) = [];  %columns
%     feature_RKI(j,:)=var(data');
% end
% 
% %%
% feature_LFD=zeros(numel(LFD_train),4)
% for j=1:numel(LFD_train)
%      data=LFD_train{j};
%     data( :, ~any(data,1) ) = [];  %columns
%     feature_LFD(j,:)=var(data');
% end
% 
% %%
% 
% %%
% feature_RFD=zeros(numel(RFD_train),4)
% for j=1:numel(RFD_train)
%      data=RFD_train{j};
%     data( :, ~any(data,1) ) = [];  %columns
%     feature_RFD(j,:)=var(data');
% end

% GMM{1}= fitgmdist(feature,2); % max number of components
% GMM{2} = fitgmdist(feature_LKI,1);
% GMM{3} = fitgmdist(feature_RKI,1);
% GMM{4} = fitgmdist(feature_LFD,1);
% GMM{5} = fitgmdist(feature_RFD,1);
% 
% 


%% test part
% % normal
% class_assigned=zeros(1, numel(Normal_test));
% for j=1:numel(Normal_test)
%     data=Normal_test{j};
%     data( :, ~any(data,1) ) = [];  %columns
%     varinace=var(data');
%     for m=1:5
%         [pr nlogl(m)] = posterior(GMM{m}, varinace)
%     end
%        [val, class_assigned(j)]=min(nlogl);
% end
%% lki
class_assigned=zeros(1, numel(LKI_test));
for j=1:numel(LKI_test)
    data=LKI_test{j};
    data( :, ~any(data,1) ) = [];  %columns
    varinace=var(data');
    for m=1:5
        [pr nlogl(m)] = posterior(GMM{m}, varinace)
    end
       [val, class_assigned(j)]=min(nlogl);
end
%% rki
class_assigned=zeros(1, numel(RKI_test));
for j=1:numel(RKI_test)
    data=RKI_test{j};
    data( :, ~any(data,1) ) = [];  %columns
    varinace=var(data');
    for m=1:5
        [pr nlogl(m)] = posterior(GMM{m}, varinace)
    end
       [val, class_assigned(j)]=min(nlogl);
end

%% lfd
class_assigned=zeros(1, numel(LFD_test));
for j=1:numel(LFD_test)
    data=LFD_test{j};
    data( :, ~any(data,1) ) = [];  %columns
    varinace=var(data');
    for m=1:5
        [pr nlogl(m)] = posterior(GMM{m}, varinace)
    end
       [val, class_assigned(j)]=min(nlogl);
end


%% rfd
class_assigned=zeros(1, numel(RFD_test));
for j=1:numel(RFD_test)
    data=RFD_test{j};
    data( :, ~any(data,1) ) = [];  %columns
    varinace=var(data');
    for m=1:5
        [pr nlogl(m)] = posterior(GMM{m}, varinace)
    end
       [val, class_assigned(j)]=min(nlogl);
end

