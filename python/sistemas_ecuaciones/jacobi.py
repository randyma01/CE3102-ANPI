from copy import deepcopy
import numpy as np

""" 
Esta funcion encuentra la solucion a un sistema 
de ecuaciones representado mediante la expresion:
A * x = b, utilizando el metodo de Jacobi.

El metodo de Jacobi utiliza la siguiente formula:

-> A * x = b   
-> (M - N) * x = b
-> M * x = (N * x) + b
-> x = (M^-1 * N * x) + (M^-1 * b)

donde:

-> M^-1 = matriz diagonal inversa
-> N = matriz A con diagonal de ceros y valores negativos
Para el cálculo de la norma, se aplica la formula 
Euclidiana o norma 2. 
Firma: xk = jacobi(A,b)

Usando la convencion de nombramiento estandar de Python3
se declararon:

 A = A
 b = b
 M = m
 N = n

Entradas: 
  A = matriz de coeficientes
  b = vector de valores independientes
           
Salida:                           
  xk = vector de incognitas
"""

A = [[5, 1, 1], [1, 5, 1], [1, 1, 5]]
b = [[7], [7], [7]]

# declaracion: matriz de entrada a objeto matriz de numpy
a = np.matrix(A)
print(a)

# declaracion: vector resultante
xk = []

# calculo: dimensiones de la matriz A %
[m, n] = a.shape

print(m, n)

x0 = np.zeros(m)

print(x0)

print("------------")

""" m = np.diag(np.diag(a))
print(m)

print("------------")

n = m - a
print(n)

print("------------")

d = np.diag(m)
print(d)

print("------------")
m_inv = np.diag(1./d)
print(m_inv) """
