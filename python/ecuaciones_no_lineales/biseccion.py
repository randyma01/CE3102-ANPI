from sympy import sympify
import matplotlib.pyplot

def biseccion(f,a,b,tol,iterMax):
    funcion = sympify(f)
    fa=funcion.subs({'x': a})
    fb=funcion.subs({'x': b})
    
    if fa*fb>0:
        x=[]
        k=[]
        error=[]
        display('El teorema de Bolzano no se cumple, es decir, f(a)*f(b)>0')
    else:
        error=tol+1
        k=0
        it=[]
        e=[]
        while error>tol and k<iterMax:
            k=k+1
            x=(a+b)/2
            fa=funcion.subs({'x': a})
            fx=funcion.subs({'x': x})
            error=abs(fx)
            it.append(k)
            e.append(error)
            if fa*fx<0:
                b=x                
            else:
                a=x   
    matplotlib.pyplot.plot(it, e)
    return [x,k,error]