clear, clc;
load q1x.dat;
load q1y.dat;
nIters = 200000;
epsilon = 1e-8;
learning_rate = 0.001;
x = [ones(size(q1x,1), 1), q1x];
y = q1y;
%% Gradient Descent
[w, steps] = GD( x, y, learning_rate,  nIters ,epsilon);
drawResult( x, y, w, 'Gradient Descent');
display(['GD steps:', num2str(steps)]);
%% Stochastic Gradient Descent
learning_rate = 1;
[w, steps] = SGD( x, y, learning_rate,  nIters ,epsilon);
drawResult( x, y, w, 'Stochastic Gradient Descent');
display(['SGD steps:', num2str(steps)]);
%% Newton's Method
[w, steps] = Newton( x, y, nIters ,epsilon);
drawResult( x, y, w, 'Newton Method');
display(['Newton Method steps:', num2str(steps)]);