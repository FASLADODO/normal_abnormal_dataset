% covariance representation
function [Xa] = MakeCovarianceMatrix(seq) 

[N T]=size(seq);

%reshape the data to shape 25xT, where T - number of frames
input=reshape(seq', 75, N/25);
[N T]=size(input);


% select only leg-related joints


Xa=1/(1-T)*input*(1/T* eye(T)-ones(T,T))*transpose(input);
% 3J×3J SPD matrix


end