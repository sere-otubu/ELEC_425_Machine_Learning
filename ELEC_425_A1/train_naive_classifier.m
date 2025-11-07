close all; clc;
%----------Train Section-------------
% Load the data
load('assignment1.mat');

D = 64; % Number of features
K = 10; % Number of class-conditional Gaussians
mk = 700;  % Number of training images
mt = 400; % Number of test images

% Converting the real-valued features into binary features for training
binary_features_train = digits_train > 0.5;
parameters = zeros(D, K);

for k = 1:K
    % Since the data are 0/1, the mean is exactly the probability a
    % pixel 'On' for that digit
    parameters(:, k) = mean(binary_features_train(:, :, k), 2);
end

% Display plots of digit images

figure;
for k = 1:K
     subplot(2, 5, k);
     imagesc(reshape(parameters(:, k), [8, 8])'); % reshape vector to 8x8 image
     axis equal; axis off;
     colormap gray;
     title(['Digit ' num2str(mod(k, 10))]);
end

%----------Test Section-------------
% Converting the real-valued features into binary features for testing
binary_features_test = digits_test > 0.5;
% Initialize matrix that will store Native Bayes Classifier errors
errors_nb = zeros(1, K);

for k = 1:K
    B_test = binary_features_test(:, :, k);
    pbCk = zeros(K, mt);
    % Loop through all possible classes
    for c = 1:K
        pb1Ck = parameters(:, c);
        pb0Ck = 1 - pb1Ck;
        % Applying Native Bayes formula given in assignment
        pbCk(c, :) = prod((pb1Ck .^ B_test) .* (pb0Ck .^ (1 - B_test)), 1);
    end
    % Finding the class with the highest likelihood
    [~, predicted] = max(pbCk, [], 1);
    % Counting how many test images were misclassified
    errors_nb(k) = sum(predicted ~= k);
end

total_errors = sum(errors_nb);
error_rate_nb = total_errors / (K * mt);
fprintf('Naive Bayes total errors = %d, error rate = %.4f\n', ...
    total_errors, error_rate_nb);

save('naive_results.mat','errors_nb','error_rate_nb');
