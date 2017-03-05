function [ gernalization_error ] = learningCurveSVM(file, xtest, ytest)
    gernalization_error = zeros(length(file),1);
    for i=1:length(file)
        load(['data\train', file{i}, '.mat']);
        xtrain = x;
        ytrain = y;
        clear x y;
        model = svmlib.matlab.train(ytrain, xtrain ,['liblinear_options', 'row']);
        [~, accuracy, ~] = svmlib.matlab.predict(ytest, xtest, model,...
            ['liblinear_options', 'col']);
        gernalization_error(i) = 1-accuracy(1)/100;
        disp(['error rate of file ', file{i} ': ', num2str(100*gernalization_error(i)), '%']);
    end
end