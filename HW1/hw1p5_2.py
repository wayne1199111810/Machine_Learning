"""
Created on Fri Feb  3 13:01:53 2017
@author: wayne
This file uses ploynomial function as a kernel function

"""

import numpy as np
import matplotlib.pyplot as plt
import math

xTrain = np.matrix(np.loadtxt('xTrain.dat'))
yTrain = np.matrix(np.loadtxt('yTrain.dat'))
row, traincol= xTrain.shape
xTest = np.matrix(np.loadtxt('xTest.dat'))
ytest = np.matrix(np.loadtxt('yTest.dat'))
row, testcol= xTest.shape
EmsTrain = []
EmsTest = []
for i in range (0,10):
    x = np.ones((1, traincol))
    xx = np.ones((1, testcol))
    for j in range(1, i+1):
        x = np.concatenate([x, np.power(xTrain, j)], axis = 0)
        xx = np.concatenate([xx, np.power(xTest, j)], axis = 0)
    w = np.dot(yTrain, np.linalg.pinv(x))
    predictTrain = np.dot(w, x)
    tmp = yTrain-predictTrain
    EmsTrain.append(math.sqrt(np.sum(np.power(tmp, 2)) / traincol))
    predictTest = np.dot(w, xx)
    tmp = ytest-predictTest
    EmsTest.append(math.sqrt(np.sum(np.power(tmp, 2)) / testcol))

plt.figure(1, figsize=(20,10))
s1 = plt.plot(EmsTrain, 'bo-', label = 'Training')
s2 = plt.plot(EmsTest, 'ro-', label = 'Testing')
plt.ylabel('Erms')
plt.xlabel('M')
plt.legend(handles=[s1[0], s2[0]], loc=2)
plt.show()
