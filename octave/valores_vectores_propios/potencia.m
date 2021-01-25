function c = potencia(A)
  %valores_propios = eig(A) % -1, -2, -4

  x = [1; 1; 1]
  iter = 5;

  for (k = 1 : iter)
    y = A * x;
    c = norm( y,'inf');
    x = (1 / c) * y;
    display(['Iteracion' num2str(k) ' : valor proprio = ' num2str(c)])
    end 
end

% A = [-3, 1, 0; 1, -2, 1; 0, -1, 3]

% c = potencia(A)