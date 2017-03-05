function [ B, I ] = tokens( xtrain, ytrain)
    col = size(xtrain, 2);
    indexSpam = find(ytrain==1);
    indexNotSpam = find(ytrain==-1);
    indicator = zeros(2, col);
    for j=1:col
        indicator(1, j) = 1 + sum(xtrain(indexSpam, j));
        indicator(2, j) = 1 + sum(xtrain(indexNotSpam, j));
    end
    [B, I] = sort(log(indicator(1,:)./ indicator(2,:)), 'descend');
    B = B(1:5);
    I = I(1:5);
end

