%check if left or right sequence and flip of needed
function left_cycle_left=L_or_Right_sequence(seq)
[N T]=size(seq);
N/25
data=reshape(seq', 75, N/25);
anklZ=data([14*3+1:14*3+3],:);
ankrZ=data([18*3+1:18*3+3],:);
[N T]=size(data);

 
subplot(2,1,1);
plot(anklZ');title('Left');
subplot(2,1,2);
plot(ankrZ'); title('Right');

%% get the data about 
x=anklZ(3,:)';
LEFT_original=anklZ;
A=(max(x)-abs(min(x)))/2;
A
%%
% temp=x;
% x=y';
% y=temp;
% yu = max(y);
% yl = min(y);
% yr = (yu-yl);                               % Range of ‘y’
% yz = y-yu+(yr/2);
% zx = x(yz .* circshift(yz,[0 1]) <= 0);     % Find zero-crossings
% per = 2*mean(diff(zx));     
% per=32/2*3.14;% Estimate period
% ym = mean(y);                               % Estimate offset
% fit = @(b,x)  b(1).*(sin(2*pi*x./b(2) + 2*pi/b(3))) + b(4);    % Function to fit
% fcn = @(b) sum((fit(b,x) - y).^2);                              % Least-Squares cost function
% s = fminsearch(fcn, [yr;  per;  -1;  ym])                       % Minimise Least-Squares
% xp = linspace(min(x),max(x));
% figure(1)
% plot(x,y,'b',  xp,fit(s,xp), 'r')
% grid

%%
% find the value pairs where the sign is changes
LeftLeg=1;
period=[];
for i=2:size(x)
    previous=x(i-1);
    current=x(i);
    if ((previous>A) &&  (current<=A))
        period=[period, i-1];
    end
end
    
% 4 of those = cycle
if size(period<2) % no period detected
    period=[];
    % change the left for right and check again
    LeftLeg=0;
    data1=MirrowData(data);   
    anklZ=data1([14*3+1:14*3+3],:);
    x=anklZ(3,:)';
    A=(max(x)-abs(min(x)))/2;
        for i=2:size(x)
             previous=x(i-1);
             current=x(i);
                if ((previous>A) &&  (current<A))
                     period=[period, i-1];
                end
                
        end
end


% if no right or left sequence were detected
if numel(period)<2 
  
    figure
    subplot(2,1,1);
    plot(LEFT_original'); title('Left X Y Z value');axis tight
    subplot(2,1,2); 
    plot(anklZ'); title('Left converted from right X Y Z values');axis tight
    period=[1, T];
    LeftLeg = input('no section were detected, decide if you want to keep it, and if yes, for which foot: 1-left, 2=right, 5=skip :');
    period=input('and which frames first-last');
    if(LeftLeg==2)
        data=MirrowData(data);   
    end
    left_cycle_left{1}=data(:,period(1):period(2));
    if LeftLeg==5
        return
    end
elseif (LeftLeg==1)
    for p=1:numel(period)-1
        left_cycle_left{p}=data(:,period(p):period(p+1)); %take first period
    end
else
        data=MirrowData(data);
        for p=1:numel(period)-1
        left_cycle_left{p} = data(:,period(p):period(p+1));
        %period=[1, size(left_cycle_left,2)];

        end
end    
%%
%reshape the data to shape 25xT, where T - number of frames
% select only leg-related joints

% 
% %%
% % AnkleLeft	14 	Left ankle
% % AnkleRight	18 	Right ankle
% % ElbowLeft	5 	Left elbow
% % ElbowRight	9 	Right elbow
% % FootLeft	15 	Left foot
% % FootRight	19 	Right foot
% % HandLeft	7 	Left hand
% % HandRight	11 	Right hand
% % HandTipLeft	21 	Tip of the left hand
% % HandTipRight	23 	Tip of the right hand
% % Head	3 	Head
% % HipLeft	12 	Left hip
% % HipRight	16 	Right hip
% % KneeLeft	13 	Left knee
% % KneeRight	17 	Right knee
% % Neck	2 	Neck
% % ShoulderLeft	4 	Left shoulder
% % ShoulderRight	8 	Right shoulder
% % SpineBase	0 	Base of the spine
% % SpineMid	1 	Middle of the spine
% % SpineShoulder	20 	Spine at the shoulder
% % ThumbLeft	22 	Left thumb
% % ThumbRight	24 	Right thumb
% % WristLeft	6 	Left wrist
% % WristRight	10 
% %seq=seq(15, 19, 16, 20, 13, 17, 14, 18, 2,:); %take only left ankle, right ankle, left foot, right foot, l hip, r hip, l knee, r knee, mid spine
% 
% % make two matrice, for the right and left foot. for the second one simply
% % flip the model
% 
% %check the Z coordinates of two feet
%    if (anklZ<ankrZ) %then the left foot is in front
%        % DO NOTHING
%        left=seq;
%    else
%        %right foot is in the front, reshape the data for the feet and arms
%     AnkleLeft = seq(15:25:end,:);
%     AnkleRigth=seq(19:25:end, :);
%     ElbowLeft=seq(6:25:end,:);
%     ElbowRight=seq(10:25:end,:);	
%     FootLeft=seq(16:25:end,:);		
%     FootRight=seq(20:25:end,:);
%     HandLeft=seq(8:25:end,:);	
%     HandRight=seq(12:25:end,:);
%     HandTipLeft=seq(22:25:end,:);	
%     HandTipRight=seq(24:25:end,:);
%     HipLeft=seq(13:25:end,:);
%     HipRight=seq(17:25:end,:);
%     KneeLeft=seq(14:25:end,:);
%     KneeRight=seq(18:25:end,:);
%     ShoulderLeft=seq(5:25:end,:);	
%     ShoulderRight=seq(9:25:end,:);	
%     ThumbLeft=seq(23:25:end,:);%	22 	Left thumb
%     ThumbRight=seq(25:25:end,:);%	24 	Right thumb
%     WristLeft=seq(7:25:end,:); %	6 	Left wrist
%     WristRight=seq(11:25:end,:)%	10 
 %% plot final period
 close all
figure
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
      pause();
end
    pause();
    % possibly filtering

end
