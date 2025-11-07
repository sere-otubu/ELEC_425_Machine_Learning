close all; clc;
load gaussian_results.mat
load naive_results.mat

error_table = [errors_gaussian; errors_nb];

fprintf('\nError counts per digit: \n');
disp(array2table(error_table, ...
    'VariableNames', {'0','1','2','3','4','5','6','7','8','9'}, ...
    'RowNames', {'Gaussian','Naive Bayes'}));

fprintf('\nGaussian total error rate: %.4f\n', error_rate_gaussian);
fprintf('Naive Bayes total error rate: %.4f\n', error_rate_nb);