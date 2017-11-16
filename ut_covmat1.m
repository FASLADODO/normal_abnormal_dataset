%
% unit test to figure out smart covmat
%
%
function ut_covmat1;

% Generate synthetic data

X = randn(27, 1000);


figure; imagesc(C);


function C = do_cov(X)
    T = size(X, 2);
    C = 1/(T-1)*X*(1/T* eye(T) - ones(T, T))*X';

