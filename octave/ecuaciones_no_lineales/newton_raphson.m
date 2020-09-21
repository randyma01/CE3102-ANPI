function [x,k,error]=newton_raphson(f,xo,tol,imax)    
    pkg load symbolic 
    syms x;
    f1= matlabFunction(sym(f));  % Se obtiene la funcion
    df = matlabFunction(diff(sym(f1)))
    k=0;
    error=tol+1;
    e=[];
    while and(error>tol,k<imax)
        if (df(xo)==0)
            x=[],k=[]; error=[];
            display('La funcion se indefine en xo')
        else
            xn= xo - (f1(xo)/df(xo));
            error= abs(xo - (f1(xo)/df(xo)));
            e=[e error];
            xo=xn;
            k=k+1;
        endif
    endwhile
    plot(1:k,e)
endfunction

% [x,k,error]=newton_raphson(cos(2*x).^2-x.^2,3/4,10^-8,10)