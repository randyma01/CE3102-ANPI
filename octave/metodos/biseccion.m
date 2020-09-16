function [x, error, iter]=biseccion(f,a,b,tol)
  func = str2func(f);
  %func=@(x)exp(x)-x-2; % func %
  if (func(a)*func(b) <=0 )
    %tol = 10^-8;
    error = tol + 1;
    iter = 0; 
    e = [];
    while (error > tol) 
      iter = iter + 1;
      x = (a+b)/2;
      if (func(a)*func(x) <= 0) 
        b = x;
      else 
        a = x;
      end  
      error = abs(func(x));
      e = [e error];
    end
    plot(1:iter, e)
    xlabel('iter (k)')
    ylabel('Error (|f(x_k)|)')
    title('Error del Metodo de la Biseccion')
  else
    display('No cumple la condicion del Teorema de Bolzano')  
  end
end


[x, error, iter]=biseccion(0,2)
[x, error, iter]=biseccion('@(x)exp(x)-x-2',0,2,10^-8)