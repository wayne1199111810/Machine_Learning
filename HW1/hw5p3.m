clear, clc;
xtest = load( 'xTest.dat');
xtrain = load('xTrain.dat');
ytrain = load( 'yTrain.dat');
ytest = load ('yTest.dat');

lambd = 10.^(linspace(-10,10, 21));