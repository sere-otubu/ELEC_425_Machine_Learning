clear all;
close all; % Close previous figures

% Load data
load data;

% Uncomment whichever K-medoid you want to run

% --- Run K-medoids with 2 clusters ---
disp('Running K-medoids with 2 clusters...');
k_medoids(data, 2);

% % --- Run K-medoids with 3 clusters ---
% disp('Running K-medoids with 3 clusters...');
% k_medoids(data, 3);
% 
% % --- Run K-medoids with 4 clusters ---
% disp('Running K-medoids with 4 clusters...');
% k_medoids(data, 4);