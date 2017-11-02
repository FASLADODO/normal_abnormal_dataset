% read data function
function [XYZ] = GetDataXYZ(address)
%check what is in this folder
file_to_read = strcat(address, '\skeleton.txt');
M = dlmread(file_to_read);

Joints = M(:, 4:end);
[samples, joints]=size(M);
X=Joints(:,1:7:end);
Y=Joints(:,2:7:end);
Z=Joints(:,3:7:end);

%% Pre-processing of the data
% As  a  common  preprocessing  steps,  we  compute  the  relative  
% difference  of  each  joint’  triplets [xi(t), yi(t), zi(t)]?
 % with the position of the root joint [xroot(t), yroot(t), zroot(t)]? for any t . 
% root is the hip joint --> we take the spin base joint
X=bsxfun(@minus,X,X(:,1));
Y=bsxfun(@minus,Y,Y(:,1));
Z=bsxfun(@minus,Z,Z(:,1));
%% TO DO ?
%   Determine  the  normalising  lengthLi as  the  average Euclidean
%   distance between the joints and the centroid C and normalize

X1=[]; Y1=[]; Z1=[];


for i=1:samples
 X1=[X1, X(i,:)];
 Y1=[Y1, Y(i,:)];
 Z1=[Z1, Z(i,:)];
end

XYZ=[X1', Y1', Z1'];

%PlotData(XYZ); % Nx3
 