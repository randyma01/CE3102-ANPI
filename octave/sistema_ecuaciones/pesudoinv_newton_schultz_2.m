function x = pesudoinv_newton_schultz_2(A, b)

    % Dimension A = (filas, columnas) %
    [m, n] = size(A);

    % Tolerancia %
    tol = 10^-8;

    % Error %
    err = tol + 1;

    % Valor Inicial X0 %
    x0 = (1 / norm(A)^2) * A';

    % Vector Resultante %
    xk = x0;

    % Iteracion para hallar la Pseudoinversa %
    while (tol < err)
        xk = xk * (2* eye(m) - A * xk);
        err = norm(A * xk * A - A, 'fro');
    end

    % Pseudoinversa %
    Ap = xk;

    % Aproximar la Solucion %
    x = Ap * b;

    % Error %
    error = norm(A * x - b);
  
end

% A = [4, 2; -5, 3; 0, 1; 4, 1; 3, 0]
% b = [1; -1; 2; -2; 3]

% x = pesudoinv_newton_schultz_2(A, b)