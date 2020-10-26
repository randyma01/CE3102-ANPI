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

Firma: 
    xk = jacobi(A,b)

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

# declaracion: matriz de entrada a objeto matriz de numpy #

print("------------")
a = np.matrix(A)
print(a)

print("------------")

# declaracion: vector resultante #
xk = []
print("xk: ", '\n', xk)

print("------------")

# calculo: dimensiones de la matriz a #
[m, n] = a.shape
print("m: ", m, '\n', "n: ", n)

print("------------")

""" despues de las validaciones """

# declaracion: vector inicial #
x0 = np.zeros((m, 1))
print("x0: ", '\n', x0)

print("------------")

# asignacion: vector resultante #
xk = x0
print("xk: ", '\n', xk)

print("------------")

# declaracion: matrices M y N #
m = np.diag(np.diag(a))
n = m - a
print("m: ", '\n', m)
print('\n')
print("n: ", '\n', n)

print("------------")

# declaracion: matriz inversa de M #
d = np.diag(m)
m_inv = np.diag(1./d)
print("d: ", d)
print('\n')
print("m_inv: ", '\n',  m_inv)

print("------------")

# declaracion: tolerancia #
tol = (10)**(-8)
print("tol: ", tol)

print("------------")

# declaracion: vector de error #
err = tol + 1
e = []
print("err: ", err)
print("e: ", e)

print("------------")

# declaracion: numero de iteraciones realizadas #
iter = 0
print("iter: ", iter)

print("------------")

print((m_inv * n * xk), (m_inv * b))

""" # itereacion: mientras el error sea mayoer que la tolerancia se ejecuta #
# la siguiente serie #
while(iter < 23):
    xk = (m_inv * n * xk) + (m_inv * b)  # formula de jacobi
    # calculo del error absoluto mediante la norma 2
    err = np.linalg.norm(a * xk - b)
    e.append(err)  # actualizacion del vector de error
    iter += 1  # aumento del contador de iteraciones realizadas

print("------------")

print("xk: ", xk)

print("------------")

print("iter: ", iter)

print("------------")
 """
