function [xk, k, error] = punto_fijo(f, a, b, x0, tol, iterMax)
    f1 = str2func(f); % 1    
    % f1 = matlabFunction(sym(f)); % 2

    k = 0;
    error = tol + 1;
    e = [];

    while (tol < error && k < iterMax)
        xk= f1(x0);
        error = abs(f1(xk) - xk);
        e = [e error];
        x0 = xk;
        ++k; 
    end
    
    plot(1 : k, e)
    xlabel('iter (k)')
    ylabel('Error (|f(x_k)|)')
    title('Error del Metodo del Punto Fijo')
end

% 1
% [xk, k, error] = punto_fijo('@(x)log(2*x+1)', 0.5, 1, 2, 10^-8, 5)

% 2
% [xk, k, error] = punto_fijo(log(2*x+1), 0.5, 1, 2, 10^-8, 5)