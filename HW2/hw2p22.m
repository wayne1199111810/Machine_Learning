clear, clc;
load q1x.dat;
load q1y.dat;
nIters = 20000;
[m,n] = size(q1x);
d = 1e-8;
rate = 0.001;
w = zeros(3, 1);
x = [ones(m, 1), q1x];
y = q1y;

for i=1:nIters
    h = ones(m,1)./(ones(m,1)+exp(-x*w));
    w = w - rate* x' * (h - y);
end

h = round (ones(m,1)./(ones(m,1)+exp(-x*w)));
error = sum(abs(h-y))
