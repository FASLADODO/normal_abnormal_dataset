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
X1=[]; Y1=[]; Z1=[];


for i=1:samples
 X1=[X1, X(i,:)];
 Y1=[Y1, Y(i,:)];
 Z1=[Z1, Z(i,:)];
end

XYZ=[X1', Y1', Z1'];

%PlotData(XYZ); % Nx3
 