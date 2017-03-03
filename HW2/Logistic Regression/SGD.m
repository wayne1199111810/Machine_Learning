function [w, steps] = SGD( x, y, r0,  nIters, epsilon)
    [m,~] = size(x);
    w = zeros(3, 1);
    logistic = @(x,w,m)ones(m,1)./(ones(m,1)+exp(-x*w));
    loss = sum(y-logistic(x, w, m));
    pre_loss = 0;
    steps=0;
    while  abs(loss - pre_loss) > epsilon && steps < nIters
        i = ceil(99 * rand(1));
        learning_rate = r0 / ((1+r0 * steps )^0.75);
        xi = x(i,:);
        h = logistic(xi, w, 1);
        w = w - learning_rate * xi' * (h - y(i));
        pre_loss = loss;
        loss = sum(y-logistic(x, w, m));
        steps = steps + 1;
    end
end