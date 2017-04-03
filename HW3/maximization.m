function [prior, m, sigma ] = maximization(m, W, X, k, prior, sigma)
    [row, n] = size(X);
    for i = 1 : k
        prior(i) = mean(W(:, i), 1);
        
        % Divide by the sum of the weights.
        m(i, :) = (W(:, i)' * X) ./ sum(W(:, i), 1);
        sigma_k = zeros(n, n);
        meanDiff = bsxfun(@minus, X, m(i, :));
        for j = 1 : row
            sigma_k = sigma_k + (W(j, i) .* (meanDiff(j, :)' * meanDiff(j, :)));
        end
        sigma(:, :, i) = sigma_k ./ sum(W(:, i));
    end
end

