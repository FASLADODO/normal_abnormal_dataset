% covariance representation
function [Xa] = MakeCovarianceMatrix(data) 
for j=1:numel(data)

seq=data{j};
[N T]=size(seq);

%reshape the data to shape 25xT, where T - number of frames
input=reshape(seq', 75, N/25);
% select only leg-related joints


%%
% nkleLeft	14 	Left ankle
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
%temp=input;
[ign t]=size(input);
input=input([14*3+1:14*3+3, 12*3+1:12*3+3, 13*3+1:13*3+3, 15*3+1:15*3+3, 3*3+1:3*3+3, 19*3+1:19*3+3, 17*3+1:17*3+3,  16*3+1:16*3+3,  18*3+1:18*3+3],:); %take only left ankle, right ankle, left foot, right foot, l hip, r hip, l knee, r knee, mid spine
           %([15*3+1:15*3+3, 19*3+1:19*3+3, 16*3+1:16*3+3, 20*3+1:20*3+3, 13*3+1:13*3+3, 17*3+1:17*3+3, 14*3+1:14*3+3, 18*3+1:18*3+3, 2*3+1:2*3+3],:)
% make two matrice, for the right and left foot. for the second one simply
% flip the model

% XYZ=reshape(input, 3, 9*t)';
% 
 %PlotData_with_selected(seq, XYZ);

[N T]=size(input);


Xa{j}=1/(T-1)*input*(1/T* eye(T)-ones(T,T))*transpose(input);
% 3J×3J SPD matrix

end
end