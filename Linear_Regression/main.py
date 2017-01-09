# -*- coding: utf-8 -*-
"""
Created on Mon Jan  9 10:57:46 2017

@author: wayne
"""

import linearRegression as lrlw
import scipy.io as sio
import matplotlib.pyplot as plt

matcontent = sio.loadmat('train.mat')
X = matcontent['X']
y = matcontent['y']
lr = lrlw.LinearRegression(X, y)

value = lr.predictValue(X)
plt.figure(figsize=(20,10))
s1 = plt.scatter(X, y, alpha=0.5, label = 'original data')
s2 = plt.scatter(X,value, color = 'r', alpha=0.5, label = 'predicted value')
plt.ylabel('y')
plt.xlabel('x')
plt.title('Linear Regression')
plt.legend(handles=[s1, s2], loc=2)
plt.show()

value = lr.predictValue_local(X, 1)
plt.figure(figsize=(20,10))
s1 = plt.scatter(X, y, alpha=0.5, label = 'original data')
s2 = plt.scatter(X,value, color = 'r', alpha=0.5, label = 'predicted value')
plt.ylabel('y')
plt.xlabel('x')
plt.title('Linear Regression Local Weighted')
plt.legend(handles=[s1, s2], loc=2)
plt.show()
