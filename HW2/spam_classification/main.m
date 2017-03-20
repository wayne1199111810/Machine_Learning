clear, clc;
file = {'50', '100', '200', '400', '800', '1400'};
%% read data from file and save in mat
%{
readWord('SPARSE.TRAIN', 'train');
for i = 1: length(file)
    fileName = ['SPARSE.TRAIN.', file{i}];
    saveName = ['train', file{i}];
    readWord(fileName, saveName);
end
readWord('SPARSE.TEST', 'test');
%}
%% Naive Bayesian
load('data\train.mat');
xtrain = x;
ytrain = y;
clear x y;
load('data\test.mat');
xtest = x;
ytest = y;
clear x y;
ypredict = NB(xtrain, ytrain, xtest);
error = sum(abs(ypredict-ytest)/2) / length(ytest);
disp(['error rate: ', num2str(100*error), '%']);
%% most indicative tokens of spam
[B, I] = tokens( xtrain, ytrain);
%% learning curve
train_size = [50, 100, 200, 400, 800, 1400];
tic
gernalization_error = learningCurve(file, xtest, ytest);
toc
figure(1)
plot(train_size, gernalization_error, 'ro-');
xlabel('size of training set');
ylabel('error');
ylim([0, 1]);
title('Naive Bayesian learning curve');
%% SVM
tic
gernalization_error = learningCurveSVM(file, xtest, ytest);
toc
figure(1)
plot(train_size, gernalization_error, 'ro-');
xlabel('size of training set');
ylabel('error');
ylim([0, 1]);
title('SVM learning curve');
