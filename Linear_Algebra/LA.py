# -*- coding: utf-8 -*-
"""
Created on Sat Jan 28 14:38:26 2017

@author: wayne
"""
from IPython.core.display import HTML, Image
from IPython.display import YouTubeVideo
from sympy import init_printing, Matrix, symbols, Rational
import sympy as sym
from warnings import filterwarnings
init_printing(use_latex = 'mathjax')
filterwarnings('ignore')
import numpy as np
import matplotlib.pyplot as plt

xs = np.linspace(-5,5,num=100)
ys = (1/np.sqrt(2 * np.pi))* np.exp(-(xs ** 2)/2.0)
plt.plot(xs,ys)
ys = (1/np.sqrt(2 * np.pi))* np.exp(-((xs -3) ** 2)/2.0)
plt.plot(xs,ys)
plt.show()