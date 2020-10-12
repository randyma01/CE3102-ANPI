function [x, error, k] = biseccion(f, a, b, tol)
  func = str2func(f);
  %func=@(x)exp(x)-x-2;
  if (func(a) * func(b) <= 0)
    %tol = 10^-8;
    error = tol + 1;
    k = 0; 
    e = [];
    while (tol < error) 
      x = (a + b) / 2;
      if (func(a) * func(x) <= 0) 
        b = x;
      else 
        a = x;
      end  
      error = abs(func(x));
      e = [e error];
      ++k;
    end
    plot(1:k, e)
    xlabel('iter (k)')
    ylabel('Error (|f(x_k)|)')
    title('Error del Metodo de la Biseccion')
  else
    display('No cumple la condición del Teorema de Bolzano.')  
  end
end

% [x, err, iter] = biseccion('@(x)exp(x)-x-2',0,2,10^-8)