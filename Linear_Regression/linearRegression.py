# -*- coding: utf-8 -*-
"""
Created on Mon Jan  9 10:58:46 2017

@author: wayne
"""
from numpy import linalg as LA
import numpy as np
from math import exp

class LinearRegression:
    def __init__(self, X, y):
        self.X = X
        self.y = y
        nIters = 1000
        m, n = X.shape
        A = np.concatenate([np.ones((m, 1)), self.X], axis = 1)
        self.para = self.ogd(A, self.y, nIters)
                
    def ogd(self, A, b, nIters):
        U, s, V =LA.svd(A, full_matrices = True)
        u = 1/s[0]/s[0]
        m, n = A.shape
        xk = np.random.rand(n, 1)
        yk = xk
        theta = 1
        for i in range(0,nIters):
            gra_f = np.dot(A.T,np.dot(A, xk) - b)
            tmp_y = yk
            yk = xk - u * gra_f
            tmp_theta = theta
            theta = (1 + np.sqrt(1 + 4 * theta ** 2) ) / 2
            xk = ( yk + (tmp_theta - 1) / theta * (yk - tmp_y) + 
                tmp_theta / theta * (yk-xk) )
        gra_f = np.dot(A.T, np.dot(A, xk) - b)
        tmp_theta = theta
        theta = (1 + np.sqrt(1 + 8 * theta ** 2) ) / 2
        xk = (yk + (tmp_theta - 1) / theta * (yk - tmp_y) + 
            tmp_theta / theta * (yk-xk) )
        return xk.T
    # by linear method
    def predictValue(self, instance):
        m, n = self.X.shape
        predictedValue = (np.dot(self.para,
                                 np.concatenate([np.ones((m,1)), self.X], axis = 1).T ))
        return predictedValue

    # by local weighted method        
    def predictValue_local(self, instance, tau):
        m, n = instance.shape
        predictedValue = np.zeros((m, 1))
        for i in range(0, m):
            tmp = np.concatenate([np.zeros((m, 1)), self.X], axis = 1)
            l = np.zeros((m, m))
            for j in range(0, m):
                l[j][j] = (exp( -( (instance[i] - self.X[j]) ** 2) / 
                    (2 * tau ** 2) ))
            w = ( np.dot( LA.pinv( np.dot(np.dot(tmp.T, l), tmp)), 
                        np.dot(np.dot(tmp.T, l), self.y)) )
            predictedValue[i] = np.dot([1, instance[i]], w)
        return predictedValue