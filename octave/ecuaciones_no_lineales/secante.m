function [x,k,error]=secante(f,xo,xi,tol,imax)    
    pkg load symbolic 
    syms x;
    f1= matlabFunction(sym(f));  % Se obtiene la funcion
    %df = matlabFunction(diff(sym(f1)))
    k=0;
    error=tol+1;
    e=[];
    while and(error>tol,k<imax)
        num=(xi-xo);
        den=(f1(xi)-f1(xo));
        if (den==0)
            x=[],k=[]; e=[];
            display('La funcion se indefine en xo')
        else
            xn= xi - ((num./den)* f1(xi));
            error= abs(xn);
            e=[e error];
            xo=xi;
            xi=xn;
            k=k+1;
        endif
    endwhile
    plot(1:k,e)
endfunction

% [x,k,error]=secante(exp(-(x.^2))-x,0,1,10^-8,3)
