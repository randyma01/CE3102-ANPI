function [x, error, k] = biseccion(f, a, b, tol)
  f1 = str2func(f); % 1
  % f1 = matlabFunction(sym(f)); % 2

  if (f1(a) * f1(b) <= 0)
    error = tol + 1;
    k = 0; 
    e = [];

    while (tol < error) 
      x = (a + b) / 2;

      if (f1(a) * f1(x) <= 0) 
        b = x;
      else 
        a = x;
      end  

      error = abs(f1(x));
      e = [e error];
      ++k;
    end
    
    plot(1 : k, e)
    xlabel('iter (k)')
    ylabel('Error (|f(x_k)|)')
    title('Error del Metodo de la Biseccion')
  else
    display('No cumple la condición del Teorema de Bolzano.')  
  end
end

% 1
% [x, err, iter] = biseccion('@(x)exp(x)-x-2', 0, 2, 10^-8)

% 2
% [x, err, iter] = biseccion(exp(x)-x-2, 0, 2, 10^-8)