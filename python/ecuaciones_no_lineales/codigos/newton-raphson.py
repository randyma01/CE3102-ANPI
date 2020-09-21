from sympy import *

def newton(f, xo, tol, iterMax):
    import matplotlib.pyplot

    x = Symbol('x')
    f1 = sympify(f)
    df = diff(f1)

    error = tol + 1
    k = 0
    it = []
    e = []
    while error > tol and k < iterMax:
        k = k + 1
        if (df.evalf(subs={x: xo}) == 0):
            x = []
            k = []
            error = []
            print('La funcion se indefine en xo')
        else:
            xn = xo - (f1.evalf(subs={x: xo}) / df.evalf(subs={x: xo}))
            error = abs(xn)
            it.append(k)
            e.append(error)
            xo = xn
    matplotlib.pyplot.plot(it, e)
    return [x, k, error]

newton('cos(2*x)**2-x**2',3/4,10**-8,10)