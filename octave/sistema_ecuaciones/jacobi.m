function [xk] = jacobi(A, b)
    % declaracion: vector resultante
    xk = [];

    % calculo: dimensiones de la matriz A %
    [m, n] = size(A);
    
     % verificacion: matriz debe ser cuadrada %
    if (m != n)                    
        display("La matriz no es cuadrada.")
        return;

    % verificacion: matriz debe ser invertible %    
    elseif ( det(A) == 0)               
        display("La matriz no es invertible.")
        return;

    % verificacion: la matriz debe ser diagnonalmente dominante
    elseif(!vf_diag_dom(A, m))
        display("La matriz no es diagonalmente dominante.")
        return;

    % verificacion: el vector b debe coinicidir con la matriz %
    elseif (n != size(b, 1))           
        display("El vector de coeficientes no coincide.")
        return;
    
    % si cumple las conficiones, ejecuta el metodo de jacobi:
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