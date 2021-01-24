import math
import matplotlib.pyplot
from sympy import *


def muller(f, x0, x1, x2, tol, iterMax):
    x = Symbol('x')
    f1 = sympify(f)
    error = tol + 1
    k = 0
    it = []
    e = []

    while tol < error and k < iterMax:
        fx = f1.evalf(subs={x: x0})
        fy = f1.evalf(subs={x: x1})
        fz = f1.evalf(subs={x: x2})
        c = fz
        b = ((((x0 - x2)**2) * (fy - fz)) - (((x1 - x2)**2) * (fx - fz))
             ) / ((x0 - x1) * (x0 - x2) * (x1 - x2))
        a = (((x1 - x2) * (fx - fz)) - ((x0 - x2) * (fy - fz))) / \
            ((x0 - x1) * (x0 - x2) * (x1 - x2))
        disc = sqrt((b**2) - 4 * a * c)

        if 0 < b:
            xk = x2 - ((2 * c) / (b + disc))
        else:
            xk = x2 - ((2 * c) / (b - disc))

        error = abs(f1.evalf(subs={x: xk}))
        it.append(k)
        e.append(error)
        d1 = abs(x0 - xk)
        d2 = abs(x1 - xk)
        d3 = abs(x2 - xk)

        if max(d1, d2, d3) == d1:
            s = sorted([xk, x1, x2])
            x0 = s[0]
            x1 = s[1]
            x2 = s[2]
        elif max(d1, d2, d3) == d2:
            s = sorted([xk, x0, x2])
            x0 = s[0]
            x1 = s[1]
            x2 = s[2]
        else:
            s = sorted([xk, x0, x1])
            x0 = s[0]
            x1 = s[1]
            x2 = s[2]

        k += 1

    matplotlib.pyplot.plot(it, e)
    ans = {
        "x": xk,
        "k": k,
        "error": e[-1]
    }
    return ans

# muller('sin(x)-x/2',2,2.2,1.8,10^-8,3)
