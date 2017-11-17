function [ X_norm ] = Normalize_between_0_and_1(X)

%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
min_val=min(X,[],2); % min
max_val=max(X,[],2); % max
X_norm=bsxfun(@rdivide,(bsxfun(@minus,X, min_val)),(max_val-min_val));

end

