from sympy import *
def secante(f,xo,xi,tol,iterMax):
    import matplotlib.pyplot
    
    x = Symbol('x')
    f1=sympify(f)
    ##df=diff(f1) 
    error=tol+1
    k=0
    it=[]
    e=[]
    while error>tol and k<iterMax:
        k=k+1
        num=(xi-xo)
        den=f1.evalf(subs={x: xi})-f1.evalf(subs={x: xo})
        if(den==0):
            m=[]
            it=[]
            e=[]
            display('La funcion se indefine')
        else:
            xn=xi-((num)/(den))*((f1.evalf(subs={x: xi})))
            error = abs(xn)
            it.append(k)
            e.append(error)
            xo=xi
            xi=xn
    matplotlib.pyplot.plot(it, e)
    return [x,k,e]

secante('exp(-(x**2))-x',0,1,10**-8,3)