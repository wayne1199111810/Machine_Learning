function W = expectation( X, m, k, sigma, prior)
    [row, n] = size(X);
    pdf = zeros(row, k);
    for i = 1 : k
        Sigma = sigma(:, :, i);
        meanDiff = bsxfun(@minus, X, m(i, :));
        pdf(:, i) = 1 / sqrt((2*pi)^n * det(Sigma)) * exp(-1/2 * sum((meanDiff / Sigma .* meanDiff), 2));
    end
    pdf_w = bsxfun(@times, pdf, prior);
    W = bsxfun(@rdivide, pdf_w, sum(pdf_w, 2));
end

