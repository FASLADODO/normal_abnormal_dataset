%check if left or right sequence and flip of needed
function left=L_or_Right_sequence(seq)
[N T]=size(seq);
anklZ=seq(15,1);
ankrZ=seq(19,1);
%reshape the data to shape 25xT, where T - number of frames
% select only leg-related joints


%%
% AnkleLeft	14 	Left ankle
% AnkleRight	18 	Right ankle
% ElbowLeft	5 	Left elbow
% ElbowRight	9 	Right elbow
% FootLeft	15 	Left foot
% FootRight	19 	Right foot
% HandLeft	7 	Left hand
% HandRight	11 	Right hand
% HandTipLeft	21 	Tip of the left hand
% HandTipRight	23 	Tip of the right hand
% Head	3 	Head
% HipLeft	12 	Left hip
% HipRight	16 	Right hip
% KneeLeft	13 	Left knee
% KneeRight	17 	Right knee
% Neck	2 	Neck
% ShoulderLeft	4 	Left shoulder
% ShoulderRight	8 	Right shoulder
% SpineBase	0 	Base of the spine
% SpineMid	1 	Middle of the spine
% SpineShoulder	20 	Spine at the shoulder
% ThumbLeft	22 	Left thumb
% ThumbRight	24 	Right thumb
% WristLeft	6 	Left wrist
% WristRight	10 
%seq=seq(15, 19, 16, 20, 13, 17, 14, 18, 2,:); %take only left ankle, right ankle, left foot, right foot, l hip, r hip, l knee, r knee, mid spine

% make two matrice, for the right and left foot. for the second one simply
% flip the model

%check the Z coordinates of two feet
   if (anklZ<ankrZ) %then the left foot is in front
       % DO NOTHING
       left=seq;
   else
       %right foot is in the front, reshape the data for the feet and arms
    AnkleLeft = seq(15:25:end,:);
    AnkleRigth=seq(19:25:end, :);
    ElbowLeft=seq(6:25:end,:);
    ElbowRight=seq(10:25:end,:);	
    FootLeft=seq(16:25:end,:);		
    FootRight=seq(20:25:end,:);
    HandLeft=seq(8:25:end,:);	
    HandRight=seq(12:25:end,:);
    HandTipLeft=seq(22:25:end,:);	
    HandTipRight=seq(24:25:end,:);
    HipLeft=seq(13:25:end,:);
    HipRight=seq(17:25:end,:);
    KneeLeft=seq(14:25:end,:);
    KneeRight=seq(18:25:end,:);
    ShoulderLeft=seq(5:25:end,:);	
    ShoulderRight=seq(9:25:end,:);	
    ThumbLeft=seq(23:25:end,:);%	22 	Left thumb
    ThumbRight=seq(25:25:end,:);%	24 	Right thumb
    WristLeft=seq(7:25:end,:); %	6 	Left wrist
    WristRight=seq(11:25:end,:)%	10 
    
    seq(19:25:end, :)=AnkleLeft;
    seq(15:25:end,:)=AnkleLeft;
    
   end
end
