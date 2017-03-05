function  predict  = NB( xtrain, ytrain, xtest)
    % the index of spam mail
    indexSpam = find(ytrain==1);
    % P(D|spam): probability of a word appear in a spam mail 
    wordBagSpam = sum(sign(xtrain(indexSpam,:)),1) ./ length(indexSpam);
    % P(D): probability of a word appear in mails
    wordBag = sum(sign(xtrain), 1) ./ length(ytrain);
    % the index of words appear in mails
    indexwithWord = find(wordBag~=0);
    % P(spam): probability of spam mail
    probOfSpam = length(indexSpam) / length(ytrain);
    predict = zeros(size(xtest, 1), 1);
    for i=1:size(xtest, 1)
        prob = probOfSpam;
        for j=indexwithWord
            if xtest(i,j)~=0
                % P(Di|spam)/P(Di): probability of a word appear in spam mail
                prob = prob * wordBagSpam(j) / wordBag(j);
            else
                % (1-P(Di|spam))/P(Di): probability of a word not appear in spam mail
                prob = prob * (1 - wordBagSpam(j)) / wordBag(j);
            end
        end
        if prob > 0.5
            predict(i) = 1;
        else
            predict(i) = -1;
        end
    end
end