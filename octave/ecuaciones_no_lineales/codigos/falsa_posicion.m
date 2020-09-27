function [x, k, error] = falsa_posicion(f, a, b, tol, iterMax)
  func = matlabFunction(sym(f));
  if (func(a) * func(b) < 0)
    k = 0;
    error = tol + 1;
    e = [];
    while (tol < error && k < iterMax)
      x = b - (((b - a ) / (func(b) - func(a))) * func(b));
      error = abs(func(x));
      e = [e error];
      if (func(a) * func(x) < 0)
        b = x;
      else
        a = x;
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

% [x, k, error] = falsa_posicion(cos(x)-x,1/2,pi/4,10^-8,40) 