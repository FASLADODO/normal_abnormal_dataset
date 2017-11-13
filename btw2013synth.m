function btw2013synth()

N     = 128;
M     = 4096;

rho_z = 0.85;
var_z = 4;

K_zz  = var_z .* toeplitz(rho_z.^[0:N-1]); % Covariance matrix of the noise

x     = randn(N, M);
z     = mvnrnd(zeros(1, N), K_zz, M)';	
y     = x + z;

K_zz_inv = inv(K_zz); 

[pm_sip pf_sip] = roc_data(x'*y); % Sum-Inner-Product


[pm_sst pf_sst] = roc_data(x' * K_zz_inv * y); % Sufficient Stat.

% Transform Domain
W = dctmtx( size(x, 1) );
dx = W*x;
dy = W*y;

K_dzdz = W*K_zz*W'; % Covariance matrix of the noise in DCT domain
K_dzdz_inv = inv(K_dzdz);

[pm_dsp pf_dsp] = roc_data(dx'*dy); % Sum-Inner-Product
[pm_dss pf_dss] = roc_data(dx' * K_dzdz_inv * dy); % Sufficient Stat.

[pm_ham pf_ham] = roc_data(sign(dx)'*sign(dy)); % Hamming dist
[pm_fps pf_fps] = roc_data(sign(dx)'*K_dzdz_inv*sign(dy)); % FP Suff. Stat.

std_dz = sqrt( K_dzdz(find(eye(N))) );

K_bzbz = abs(1 - 2*acos( K_dzdz ./ (std_dz*std_dz') )/pi);
K_bzbz_inv = inv(K_bzbz);
[pm_kbz pf_kbz] = roc_data(sign(dx)'*K_bzbz_inv*sign(dy)); % FP Suff. Stat.



save( strcat('auth_synth_ROC.mat'), ...
	'pm_sip', 'pf_sip', 'pm_sst', 'pf_sst', ...
	'pm_dsp', 'pf_dsp', 'pm_dss', 'pf_dss', ...
	'pm_ham', 'pf_ham', 'pm_fps', 'pf_fps');



function [pm pf] = roc_data(CM) % CM = confusion_matrix

	N = sqrt(numel(CM)); assert(round(N) == N);
	Nbins = round(sqrt(N));
	bins = linspace(min(CM(:)), max(CM(:)), Nbins);

	intra = hist( CM( find( eye(N)) ), bins) / N;
	inter = hist( CM( find(~eye(N)) ), bins) / (N*N-N);

	pm = zeros(1, Nbins);
	pf = zeros(1, Nbins);
	for t=1:Nbins
		pm(t) = 1 - sum(intra(t:end));
		pf(t) =     sum(inter(t:end));
	end
