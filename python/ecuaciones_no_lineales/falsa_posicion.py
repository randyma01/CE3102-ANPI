import math
import matplotlib.pyplot
from sympy import *


def falsa_posicion(f, a, b, tol, iterMax):
    funcion = sympify(f)
    fa = funcion.subs('x', a)
    fb = funcion.subs('x', b)
    if (fa * fb <= 0):
        error = tol + 1
        k = 0
        it = []
        e = []
        while (tol < error and k < iterMax):
            fa = funcion.subs('x', a)
            fb = funcion.subs('x', b)
            x = b - (((b - a) / (fb - fa)) * fb)
            fa = funcion.subs('x', a)
            fx = funcion.subs('x', x)
            error = abs(fx)
            it.append(k)
            e.append(error)

            if (fa * fx < 0):
                b = x
            else:
                a = x
            k += 1
    else:
        x = []
        k = []
        error = []
        print("No cumple la condición del Teorema de Bolzano.")
    matplotlib.pyplot.plot(it, e)
    ans = {
        "x": x,
        "k": k,
        "error": e[-1]
    }
    return ans

# falsa_posicion('cos(x)-x',1/2,3.141592/4,10**-8,40)
