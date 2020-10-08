function [xn, k, error] = secante(f, xo, xi, tol, iterMax)    
    syms x;
    f1 = matlabFunction(sym(f));
    k = 0;
    error = tol + 1 ;
    e = [];
    while (tol < error && k < iterMax)
        num = (xi - xo);
        deno = (f1(xi) - f1(xo));
        if (deno == 0)
            x = [];
            k = [];
            e = [];
            disp('La función se indefine.')
            break;
        else
            xn = xi - ((num./deno)* f1(xi));
            error = abs(xn);
            e = [e error];
            xo = xi;
            xi = xn;
            ++k;
        end
    end
    plot(1:k, e)
    xlabel('iter (k)')
    ylabel('Error (|f(x_k)|)')
    title('Error del Metodo de la Secante')
end

% [x,k,error] = secante(exp(-(x.^2))-x,0,1,10^-8,3)