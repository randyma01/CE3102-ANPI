function [x, k, error]=newton_raphson(f, xo, tol, imax) 
    pkg load symbolic 
    syms x;

    % forma 1 %
    %f1 = str2func(f);
    %df = diff(sym(f1))

    % forma 2 %
    f1 = matlabFunction(sym(f)); 
    df = matlabFunction(diff(sym(f1)));
    k = 0;
    error = tol + 1;
    e = [];
    while (error > tol && k < imax)
        deno = df(xo);
        if (deno == 0)
            x = [];
            k=[]; 
            error=[];
            disp('La función se indefine.')
        else
            xn = xo - (f1(xo)/deno);
            error = abs(xo - (f1(xo)/deno));
            e=[e error];
            xo = xn;
            k = k + 1;
        end
    end
    plot(1:k,e)
    xlabel('iter (k)')
    ylabel('Error (|f(x_k)|)')
    title('Error del Metodo de la Newton-Raphson')
end

% forma 1 %
%[x,k,error]=newton_raphson('@(x)cos(2*x).^2-x.^2',3/4,10^-8,10)

% forma 2 %
%[x,k,error]=newton_raphson(cos(2*x).^2-x.^2,3/4,10^-8,10)