"""
Created on Fri Feb  3 13:01:53 2017
@author: wayne
This file implement the basic concept of close form of linear regreesion
"""

import numpy as np
import matplotlib.pyplot as plt

xTrain = np.matrix(np.loadtxt('xTrain.dat'))
ytrain = np.matrix(np.loadtxt('yTrain.dat'))
row, col= xTrain.shape
xtrain = np.concatenate([np.ones((1, col)), xTrain], axis = 0)
w = np.dot(ytrain, np.linalg.pinv(xtrain))

predictTrain = np.dot(w, xtrain)


xTest = np.matrix(np.loadtxt('xTest.dat'))
ytest = np.matrix(np.loadtxt('yTest.dat'))

row, col = xTest.shape
xtest = np.concatenate([np.ones((1, col)), xTest], axis = 0)
predict = np.dot(w, xtest)

plt.figure(1, figsize=(20,10))
s1 = plt.scatter(xTrain, ytrain, alpha = 0.5, color = 'b', label = 'train y')
s2 = plt.scatter(xTest, ytest, alpha = 0.5, color = 'g', label = 'test y')
plt.ylabel('y')
plt.xlabel('x')
s3 = plt.plot(xTest.tolist()[0], predict.tolist()[0],'r', label = 'Trend')

plt.legend(handles=[s1, s2, s3[0]], loc=2)
plt.show()
print(w)