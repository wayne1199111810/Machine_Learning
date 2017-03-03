function [w, steps] = Newton( x, y,  nIters, epsilon)
    [m,~] = size(x);
    w = zeros(3, 1);
    logistic = @(x,w,m)ones(m,1)./(ones(m,1)+exp(-x*w));
    loss = sum(y-logistic(x, w, m));
    pre_loss = 0;
    steps=0;
    while  abs(loss - pre_loss) > epsilon && steps < nIters
        pre_loss = loss;
        h = logistic(x, w, m);
        A = diag(h.*(1-h));
        H = x' * A * x;
        w = w - H\( x' * (h - y));
        loss = sum(y-logistic(x, w, m));
        steps = steps + 1;
    end
end