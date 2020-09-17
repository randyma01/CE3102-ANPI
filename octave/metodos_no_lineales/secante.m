function [x, error, iter]=secante(f, x0, x1, tol, iterMax)
  func = str2func(f);
  error = tol + 1;
  iter = 0; 
  e = [];
  while (error > tol)
    if (iterMax <= iter)
        disp("Limite maximo de iteraciones.")
        break;
    else
        x = x0 - ( (x0 - x1) / (func(x1) - func(x0) ) );
        x0 = x - 1;
        x1 = x;
    end
    error = abs(func(x));
    e = [e error];
  end
  %plot(1:iter, e)
  %xlabel('iter (k)')
  %ylabel('Error (|f(x_k)|)')
  %title('Error del Metodo de la Secante')
  
end


[x, error, iter]=secante('@(x)exp(x)-x-2',0,1,10^-8,3)