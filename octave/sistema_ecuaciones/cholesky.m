function  x = cholesky(A, b)
    [m, n] = size(A);

   if (m != n)
        display("La matriz no es cuadrada.")
        x = 0;
        return;
    end

    if( A != A')
        display("No es una matriz simetrica.")
        x = 0;
        return;
    end

    if (vf_det_sub(A) != 1)
        display("No cumple la condicion de determinantes de las submatrices.")
        x = 0;
        return;
    end


    L = eye(n);
    P = eye(n);
    U = A;

    

    %L, U
    y = sust_adelante(L,b);
    x = sust_atras(U,y);
end

% A = [25, 15, -5, -10; 15, 10, 1, -7; -5, 1, 21, 4; -10, -7, 4, 18]
% b = [-25; -19; -21, -5]


% x = cholesky(A, b)