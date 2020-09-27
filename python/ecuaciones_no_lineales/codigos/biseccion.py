import math
import matplotlib.pyplot
from sympy import *


def biseccion(f, a, b, tol, iterMax):
    f1 = sympify(f)
    fa = f1.subs('x', a)
    fb = f1.subs('x', b)
    if (fa * fb > 0):
        x = []
        k = []
        error = []
        print('No cumple la condición del Teorema de Bolzano.')
    else:
        error = tol + 1
        k = 0
        it = []
        e = []
        while (tol < error and k < iterMax):
            k = k + 1
            x = (a + b) / 2
            fa = f1.subs('x', a)
            fx = f1.subs('x', x)
            error = abs(fx)
            it.append(k)
            e.append(error)
            if (fa * fx < 0):
                b = x
            else:
                a = x
    matplotlib.pyplot.plot(it, e)
    ans = {
        "x": x,
        "k": k,
        "error": error
    }
    return ans

# biseccion('exp(x)-x-2',0,2,10**-8,10)
