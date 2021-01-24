import math
import matplotlib.pyplot
from sympy import *


def punto_fijo(p, xo, a, b, tol, iterMax):
    x = Symbol('x')
    f1 = sympify(p)
    error = tol + 1
    k = 0
    it = []
    e = []

    while tol < error and k < iterMax:
        xk = f1.evalf(subs={x: xo})
        error = abs((f1.evalf(subs={x: xk})) - xk)
        e.append(error)
        it.append(k)
        xo = xk
        k += 1

    matplotlib.pyplot.plot(it, e)
    ans = {
        "x": xk,
        "k": k,
        "error": e[-1]
    }
    return ans

# punto_fijo('log(2*x+1)',0.5,1,2,10^-8,5)
