%check if left or right sequence and flip of needed
function left_cycle_left=manual_segmentation(seq)
[N T]=size(seq);
N/25
data=reshape(seq', 75, N/25);
anklZ=data([14*3+1:14*3+3],:);
ankrZ=data([18*3+1:18*3+3],:);
[N T]=size(data);


data1=MirrowData(data);   
anklrZ=data1([14*3+1:14*3+3],:);
figure
subplot(2,1,1);
plot(anklZ'); title('Left X Y Z value');axis tight
subplot(2,1,2); 
plot(anklrZ'); title('Left from Right X Y Z values');axis tight
period=[1, T];
LeftLeg = input('no section were detected, decide if you want to keep it, and if yes, for which foot: 1-left, 2=right, 5=skip :');
  if LeftLeg==5
        left_cycle_left{1}=[];
        return
  else
    
    period=input('and which frames first-last');
        if(LeftLeg==2)
            data=MirrowData(data);   
            for p=1:numel(period)-1
                left_cycle_left{p}=data(:,period(p):period(p+1)); %take first period
            end
      elseif (LeftLeg==1)
            for p=1:numel(period)-1
                left_cycle_left{p}=data(:,period(p):period(p+1)); %take first period
            end
      end
end
 %% plot final period
close all
figure
hold on
for p=1:numel(left_cycle_left)
    if LeftLeg==5
        return
    end
    data=left_cycle_left{p};
    anklZ= data([14*3+1:14*3+3],:);
    plot(anklZ');title('Final cycle data');
 
    % resample the signal to have the same width if needed here
    
    [N T]=size( left_cycle_left{p});    
    left_cycle_left{p}=reshape(left_cycle_left{p}, 3, 25*T)';
end
   

end
















%%
% % % % % %%
% % % % % % find the value pairs where the sign is changes
% % % % % LeftLeg=1;
% % % % % period=[];
% % % % % for i=2:size(x)
% % % % %     previous=x(i-1);
% % % % %     current=x(i);
% % % % %     if ((previous>A) &&  (current<=A))
% % % % %         period=[period, i-1];
% % % % %     end
% % % % % end
% % % % %     
% % % % % % 4 of those = cycle
% % % % % % if size(period<2) % no period detected
% % % % % %     period=[];
% % % % % %     % change the left for right and check again
% % % % % %     LeftLeg=0;
% % % % % %     data1=MirrowData(data);   
% % % % % %     anklZ=data1([14*3+1:14*3+3],:);
% % % % % %     x=anklZ(3,:)';
% % % % % %     A=(max(x)-abs(min(x)))/2;
% % % % % %         for i=2:size(x)
% % % % % %              previous=x(i-1);
% % % % % %              current=x(i);
% % % % % %                 if ((previous>A) &&  (current<A))
% % % % % %                      period=[period, i-1];
% % % % % %                 end
% % % % % %                 
% % % % % %         end
% % % % % % end
% % % % % 
% % % % % 
% % % % % % if no right or left sequence were detected
% % % % % if numel(period)<2 
% % % % %   
% % % % %     figure
% % % % %     subplot(2,1,1);
% % % % %     plot(LEFT_original'); title('Left X Y Z value');axis tight
% % % % %     subplot(2,1,2); 
% % % % %     plot(anklZ'); title('Left converted from right X Y Z values');axis tight
% % % % %     period=[1, T];
% % % % %     LeftLeg = input('no section were detected, decide if you want to keep it, and if yes, for which foot: 1-left, 2=right, 5=skip :');
% % % % %     period=input('and which frames first-last');
% % % % %     if(LeftLeg==2)
% % % % %         data=MirrowData(data);   
% % % % %     end
% % % % %     left_cycle_left{1}=data(:,period(1):period(2));
% % % % %     if LeftLeg==5
% % % % %         return
% % % % %     end
% % % % % elseif (LeftLeg==1)
% % % % %     for p=1:numel(period)-1
% % % % %         left_cycle_left{p}=data(:,period(p):period(p+1)); %take first period
% % % % %     end
% % % % % else
% % % % %         data=MirrowData(data);
% % % % %         for p=1:numel(period)-1
% % % % %         left_cycle_left{p} = data(:,period(p):period(p+1));
% % % % %         %period=[1, size(left_cycle_left,2)];
% % % % % 
% % % % %         end
% % % % % end    