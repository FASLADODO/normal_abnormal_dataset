function [x1, x2] = AlignWithModel(data, model)
%UNTITLED8 Summary of this function goes here
%   Detailed explanation goes here
[x1,x2] = alignsignals(model(3,:), data(3,:)); % always align towards left ankle

subplot(2,1,1)
stem(x1)
xlim([0 mx+1])

subplot(2,1,2)
stem(x2,'*')
xlim([0 mx+1])
pause();

end

