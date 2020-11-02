% vector resultante %
xk = [];

% dimensiones de la matriz A %
[m, n] = size(A);

% verificiones que la matriz debe cumplir %
if (m != n)                    
    display("La matriz no es cuadrada.")
    return;
elseif (det(A) == 0)               
    display("La matriz no es invertible.")
    return;
elseif (!vf_diag_dom(A, m))
    display("La matriz no es diagonalmente dominante.")
    return;
elseif (n != size(b, 1))           
    display("El vector de valores independientes no coincide.")
    return;
else
    % vector inicial de ceros%
    x0 = zeros(m, 1);
    
    % asignacion vector resultante %
    xk = x0;

    % matriz M = (L + D)%
    M = tril(A);
    
    % matriz N = (-U) %
    N = A  - tril(A)

    % inversa de la matriz M%
    d = diag(M);
    Minv = diag(1./d);

    % solucion del sistema Mz = b%
    z = sust_adelante(Minv, b)

    % tolerancia dada %
    tol = 10^-8;

    % error segun la tolerancia dada %
    err = tol + 1;;

    while(tol < err)
        % calculo del nuevo b %
        b = N * xk;

        % solucion del sistema My = b
        yk = sust_atras(Minv, b);

        % formula de gauss-seidel %
        xk = yk + z; 

        % calculo del error absoluto mediante la norma 2 %
        err = norm(A * xk - b); 
    end
end

