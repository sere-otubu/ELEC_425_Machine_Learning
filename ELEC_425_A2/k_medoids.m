function [membership, centres] = k_medoids(X, n_cluster)
% X: the data matrix, rows are data points and columns are features
% n_cluster: number of cluster

if n_cluster > 4
    disp ('You have set too many clusters.');
    disp ('Set the number of clusters to be 1-4.');
    disp ('The program and visualization allow for up to 4 clusters.');
    return;
end

% Initialize the figure
figure('position', [200, 200, 600, 500]);
    
% Get the number of data points and number of features
n_sample = size(X, 1); 

% K-medoids requires centers to be actual data points.
% Randomly select n_cluster points from X as initial centers.
rng('shuffle');
rand_indices = randperm(n_sample, n_cluster);
centres = X(rand_indices, :);

disp('Start K-medoids clustering ... ');

% Initialization:
old_membership = ones(n_sample, 1);

% Display the initial cluster membership for all datapoints
% and the initial cluster centres
show(X, old_membership, n_cluster, centres, 'Cluster centres initialized!')

while true
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % E step: Assign data points to closest clusters.
    % Using Manhattan ('cityblock') distance.
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    distance = pdist2(X, centres, 'cityblock'); 
    [~, membership] = min(distance, [], 2);
    
    %Show the result of the E step.
    show(X, membership, n_cluster, centres, 'E step finished: Datapoints re-assigned!')

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % M step: Update cluster centres (medoids).
    % The new center must be one of the data points in the cluster
    % that minimizes the sum of distances to other points
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    for j = 1:n_cluster
        % Get all data points belonging to the current cluster
        cluster_points = X(membership == j, :);
        
        % Check if the cluster is empty. If so, keep the old center.
        if ~isempty(cluster_points)
            % Calculate the sum of Manhattan distances from each point
            % in the cluster to all other points in the same cluster.
            
            % 'pdist2' calculates a matrix of distances between
            % every point in cluster_points and every other point
            % in cluster_points.
            intra_cluster_distances = pdist2(cluster_points, cluster_points, 'cityblock');
            
            % Sum the distances for each point (sum across the rows)
            % This gives the total cost for each point to be the center.
            sum_distances = sum(intra_cluster_distances, 2);
            
            % Find the point that has the minimum total distance
            [~, medoid_index] = min(sum_distances);
            
            % Set the new center to be that data point
            centres(j, :) = cluster_points(medoid_index, :);
        end
    end
    
    %Show the result of the M step.
    show(X, membership, n_cluster, centres, 'M step finished: Cluster centers updated!')
    
    % Stop if no more updates.
    if sum(membership ~= old_membership)==0
        show(X, membership, n_cluster, centres, 'Done! ');
        break;
    end
    
    old_membership = membership;
end
end

function show(X, c_pred, n_cluster, centres, txt)
    % This helper function is unchanged
    symbol = ['ro'; 'gp'; 'bd'; 'k^'; 'r*'];
    hold off;
        
    for i = 1:n_cluster
        marker = mod(i,5);
        if i > 4            
            disp('Total number of clusters exceeds 4, some symbols in the plot are reused!');
        end
        plot(X(c_pred==i, 1), X(c_pred==i, 2), symbol(marker,:));
        hold on;
        plot(centres(i, 1), centres(i, 2), symbol(marker,2), 'MarkerFaceColor',symbol(marker,1));
    end
    text(4.2, 5.4, txt);
    drawnow;
    
    %Pause some time here.
    %Used to show figure with enough time.
    %You can change the pause time.
    pause(2);
end