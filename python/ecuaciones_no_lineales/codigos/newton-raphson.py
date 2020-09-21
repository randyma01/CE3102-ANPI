from sympy import *
import matplotlib.pyplot


def secante(f, xo, xi, tol, iterMax):
    f1 = sympify(f)
    error = tol + 1
    k = 0
    it = []
    e = []
    while (error > tol and k < iterMax):
        k = k + 1
        num = (xi - xo)
        deno = f1.subs('x', xi) - f1.subs('x', xo)
        if (deno == 0):
            it = []
            e = []
            print('La funcion se indefine.')
        else:
            f1_eval = f1.subs('x', xi)
            xn = xi - ((num) / (deno)) * (f1_eval)
            error = abs(xn)
            it.append(k)
            e.append(error)
            xo = xi
            xi = xn
    matplotlib.pyplot.plot(it, e)

# secante('exp(-(x**2))-x',0,1,10**-8,3)
