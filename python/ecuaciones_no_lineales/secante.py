import math
import matplotlib.pyplot
from sympy import *


def secante(f, xo, xi, tol, iterMax):
    x = Symbol('x')
    f1 = sympify(f)
    error = tol + 1
    k = 0
    it = []
    e = []
    while tol < error and k < iterMax:
        nume = (xi - xo)
        deno = f1.evalf(subs={x: xi})-f1.evalf(subs={x: xo})

        if deno == 0:
            it = []
            e = []
            print("La funcion se indefine.")
        else:
            xn = xi - ((nume) / (deno)) * ((f1.evalf(subs={x: xi})))
            error = abs(xn)
            it.append(k)
            e.append(error)
            xo = xi
            xi = xn

        k += 1
    matplotlib.pyplot.plot(it, e)
    ans = {
        "x": xn,
        "k": k,
        "error": e[-1]
    }
    return ans

# secante('exp(-(x**2))-x',0,1,10**-8,3)
