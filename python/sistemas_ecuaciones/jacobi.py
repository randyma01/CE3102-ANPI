import numpy as np
import matplotlib.pyplot as plt

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


def jacobi(A, b):
    # declaracion: parametros de entrada (listas) a objetos de numpy (matrices) #
    a = np.matrix(A)
    b = np.matrix(b)

    # declaracion: vector resultante #
    xk = []

    # calculo: dimensiones de la matriz a #
    [m, n] = a.shape

    # calculo: dimensiones de la matriz a #
    dim_b = a.shape

    if (m != n):
        print("La matriz no es cuadrada.")
        return
    elif (np.linalg.det(a) == 0):
        print("La matriz no es invertible.")
        return
    # elif(not vf_diag_dom(a, m)):
    #    print("La matriz no es diagonalmente dominante.")
    #    return
    elif (n != dim_b[1]):
        print("El vector de valores independientes no coincide.")
        return
    else:

        # declaracion: vector inicial #
        x0 = np.zeros((m, 1))

        # asignacion: vector resultante #
        xk = x0

        # declaracion: matrices M y N #
        m = np.diag(np.diag(a))
        n = m - a
        print("m: ", '\n', m)
        print('\n')
        print("n: ", '\n', n)
        print('\n')

        # declaracion: matriz inversa de M #
        d = np.diag(m)
        m_inv = np.diag(1./d)
        print("d: ", d)
        print('\n')
        print("m_inv: ", '\n',  m_inv)
        print('\n')

        # declaracion: tolerancia #
        tol = (10)**(-8)

        # declaracion: vector de error #
        err = tol + 1
        e = []

        # declaracion: numero de iteraciones realizadas #
        iter = 0

        # declaracion: vector para las iteraciones #
        it = []

        # iteracion: mientras el error sea mayoer que la tolerancia se ejecuta #
        # la siguiente serie #
        while(tol < err):
            # aumento del contador de iteraciones realizadas #
            iter += 1

            # formula de jacobi #
            xk = (m_inv * n * xk) + (m_inv * b)
            # xk = m_inv * n * xk + (np.matrix(np.diag((m_inv * b))).transpose())

            # calculo del error absoluto mediante la norma 2 #
            err = np.linalg.norm(a * xk - b)

            # actualizacion del vector de error #
            e.append(err)

            # agregando las iteraciones realizadas #
            it.append(iter)

        print("xk: ", xk)

        print("iter: ", iter)

        print("it: ", it)

        print("e: ", e)

        print("len(e): ", len(e))

        plt.title('Error vs Iteraciones')
        plt.ylabel('||A_x^k||)')
        plt.xlabel('Iteraciones')
        plt.plot(it, e)

        return xk


A = [[5, 1, 1], [1, 5, 1], [1, 1, 5]]
b = [[7], [7], [7]]

jacobi(A, b)
