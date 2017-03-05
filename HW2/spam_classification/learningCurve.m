function [ gernalization_error ] = learningCurve(file, xtest, ytest)
    gernalization_error = zeros(length(file),1);
    for i=1:length(file)
        load(['data\train', file{i}, '.mat']);
        xtrain = x;
        ytrain = y;
        clear x y;
        predict  = NB( xtrain, ytrain, xtest);
        error = sum(abs(predict-ytest)/2) / length(ytest);
        gernalization_error(i) = error;
        disp(['error rate of file ', file{i} ': ', num2str(100*error), '%']);
    end
end

