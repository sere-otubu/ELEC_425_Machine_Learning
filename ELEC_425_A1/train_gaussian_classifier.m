close all; clc;
%----------Train Section-------------
% Load the data
load('assignment1.mat');

D = 64; % Number of features
K = 10; % Number of class-conditional Gaussians
mk = 700;  % Number of training images
mt = 400; % Number of test images

% Create a D x K (64 x 10) matrix of zeros to store means
mu = zeros(D, K);

% Initialize matrix that will store Gaussian Classifier errors
errors_gaussian = zeros(1, K);

for k = 1:K
    mu(:,k) = mean(digits_train(:,:,k), 2);
end

M = K * mk; % Number of all training data points over all K classes
sigma_sq = 0;

for k = 1:K
    diff = digits_train(:,:,k) - mu(:,k);
    sigma_sq = sigma_sq + sum(diff(:).^2);
end
sigma_sq = sigma_sq / (D * M);

% Display plot of digit images
fprintf('The value of the shared variance sigma^2 = %f\n', sigma_sq);
 
figure;
for k = 1:K
     subplot(2,5,k);
     imagesc(reshape(mu(:,k), [8,8])');
     axis equal; axis off;
     colormap gray;
     title(['Digit ' num2str(mod(k,10))]);
end

%----------Test Section-------------
for k = 1:K
    X_test = digits_test(:, :, k);
    pbxCk = zeros(K, mt);
    % Loop through all possible classes
    for c = 1:K
        % difference between each test image and the mean of class c
        diff = X_test - mu(:, c);
        % square the differences and sum across all 64 features
        diff_sq = sum(diff.^2, 1);
        % Applying Guassian formula 
        pbxCk(c, :) = (2*pi*sigma_sq)^(-D/2) .* exp( -diff_sq / (2*sigma_sq) ); 
    end
    % Finding the class with the highest likelihood
    [~, predicted] = max(pbxCk, [], 1);
    % Counting how many test images were misclassified
    errors_gaussian(k) = sum(predicted ~= k);
end

total_errors_gaussian = sum(errors_gaussian);
error_rate_gaussian = total_errors_gaussian / (K * mt);
fprintf('Gaussian classifier total errors = %d, error rate = %.4f\n', ...
        total_errors_gaussian, error_rate_gaussian);

save('gaussian_results.mat','errors_gaussian','error_rate_gaussian');
