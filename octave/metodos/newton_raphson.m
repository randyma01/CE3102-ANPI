function [xk, error, iter]=newton_raphson(f,x,tol,iter_max)
  func = str2func(f);
  func_diff = diff(func);
  error = tol + 1;
  e = [];
  iter = 0;
  while (iter_max >= iter) 
    x1 = x-(func(x)/func_diff(x));
    error = abs(func(x));
    e = [e error];
    x = x1
    ++iter;
  end
  plot(1:iter, e)
  xlabel('iter (k)')
  ylabel('Error (|f(x_k)|)')
  title('Error del Metodo Newton-Raphson')
  
end

[x, error, iter]=newton_raphson('@(x)exp(x)-x-2',0,2)