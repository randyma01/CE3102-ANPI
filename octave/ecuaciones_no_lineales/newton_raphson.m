function [xn, k, error] = newton_raphson(f, xo, tol, iterMax)
    syms x;
    f1 = matlabFunction(sym(f)); 
    df = matlabFunction(diff(sym(f1)));
    k = 0;
    error = tol + 1;
    e = [];
    while (tol < error && k < iterMax)
        deno = df(xo);
        if (deno == 0)
            x = [];
            k = []; 
            error = [];
            disp('La función se indefine.')
            break;
        else
            xn = xo - (f1(xo) / deno);
            error = abs(xo - (f1(xo) / deno));
            e = [e error];
            xo = xn;
            ++k;
        end
    end
    plot(1:k, e)
    xlabel('iter (k)')
    ylabel('Error (|f(x_k)|)')
    title('Error del Metodo de la Newton-Raphson')
end

% [x, k, error] = newton_raphson(cos(2*x).^2-x.^2, 3/4, 10^-8, 10)