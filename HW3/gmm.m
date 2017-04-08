function [m, sigma, prior] = gmm( filename, k, nIters )
%GMM Summary of this function goes here
%   Detailed explanation goes here
    
    im = double(imread(filename));
    [rows, cols, dim] = size(im);
    X = reshape(im, [rows * cols, dim]);
    
    %% initialization
    indeces = randperm(rows * cols);
    m = X(indeces(1:k), :);
    sigma = zeros(dim, dim, k);
    % Use the overal covariance of the dataset as the initial variance for each cluster.
    for i = 1:k
        sigma(:, :, i) = cov(X);
    end
    % Assign equal prior probabilities to each cluster.
    prior = ones(1, k) * (1 / k);
    %% EM
    for h = 1:nIters
        prevM = m;
        W = expectation( X, m, k, sigma, prior);
        [prior, m, sigma ] = maximization(m, W, X, k, prior, sigma);
        if m == prevM
            break
        end
    end
end

