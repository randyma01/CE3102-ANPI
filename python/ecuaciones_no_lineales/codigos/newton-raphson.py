from sympy import *
import matplotlib.pyplot


def newton_raphson(f, xo, tol, iterMax):
    f1 = sympify(f)
    df = diff(f1)
    error = tol + 1
    k = 0
    it = []
    e = []
    while (error > tol and k < iterMax):
        k = k + 1
        deno = df.subs('x', xo)
        if (deno == 0):
            x = []
            k = []
            error = []
            print('La funcion se indefine.')
            break
        else:
            nume = f1.subs('x', xo)
            xn = xo - nume/deno
            error = abs(xn)
            it.append(k)
            e.append(error)
            xo = xn
    matplotlib.pyplot.plot(it, e)
    ans = {
        "x": xn,
        "k": k,
        "error": error
    }
    return ans

# newton_raphson('cos(2*x)**2-x**2',3/4,10**-8,10)
