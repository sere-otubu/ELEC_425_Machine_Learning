clear all;
close all; % Close previous figures

% Load data
load data;

% Uncomment whichever K-medoid you want to run

% --- Run K-medians with 2 clusters ---
disp('Running K-medians with 2 clusters...');
k_medians(data, 2);

% % --- Run K-medians with 3 clusters ---
% disp('Running K-medians with 3 clusters...');
% k_medians(data, 3);
% 
% % --- Run K-medians with 4 clusters ---
% disp('Running K-medians with 4 clusters...');
% k_medians(data, 4);