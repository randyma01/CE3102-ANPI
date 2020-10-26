function [xk] = jacobi(A, b)
    % declaracion: vector resultante
    xk = [];

    % calculo: dimensiones de la matriz A %
    [m, n] = size(A);
    
    if (m != n)             % verificacion: matriz debe ser cuadrada %
        display("La matriz no es cuadrada.")
        return;
    elseif ( det(A) == 0)    % verificacion: matriz debe ser invertible %
        display("La matriz no es invertible.")
        return;
    elseif (n != size(b, 1))       % verificacion: el vector b debe coinicidir con la matriz %
        display("El vector de coeficientes no coincide.")
        return;
    else
    
        % declaracion: vector inicial
        x0 = zeros(m, 1);

        % declaracion: matrices M y N
        M = diag((diag(A)));
        N = M - A;

        % declaracion: matriz inversa de M
        d = diag(M)
        Minv = diag(1./d)

        % asignacion: vector resultante
        xk = x0;

        % declaracion: tolerancia
        tol = 10^-8;

        % declaracion: vector de error
        err = tol + 1;;
        e = [];

        % declaracion: numero de iteraciones realizadas
        iter = 0;

        while(tol < err)
            xk = (Minv * N * xk) + (Minv * b);
            err = norm(A * xk - b)
            e = [e err];
            ++iter;
        end

        iter
        % grafica: 
        plot(1 : iter, e)
        xlabel('Iteraciones')
        ylabel('Error: (||A_x^k||)')
    end
end

% A = [5,1 ,1; 1, 5, 1; 1, 1, 5]
% b = [7; 7; 7]

% x = jacobi(A, b)