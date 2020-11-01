function [xn, k, error] = falsa_posicion(f, xo, xi, tol, iterMax)
  f1 = matlabFunction(sym(f));
  if (f1(xo) * f1(xi) <= 0)
    k = 0;
    error = tol + 1;
    e = [];
    while (tol < error && k < iterMax)
        num = (xi - xo);
        deno = (f1(xi) - f1(xo));
        xn = xi - ((num./deno)* f1(xi));
        % xn = xi - (((xi - xo) / (f1(xi) - f1(xo))) * f1(xi));
        error = abs(f1(xn));
        e = [e error];
        if (f1(xo) * f1(xn) <= 0)
          xi = xn;
        else
          xo = xn;
        end
        ++k;
    end
    plot(1:k, e)
    xlabel('iter (k)')
    ylabel('Error (|f(x_k)|)')
    title('Error del Metodo de la Falsa Posicion')
  else
    display('No cumple la condición del Teorema de Bolzano.')
  end
end

% [x, k, error] = falsa_posicion(cos(x)-x, 1/2, pi/4, 10^-8, 40) 