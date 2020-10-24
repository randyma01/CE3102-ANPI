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

    for (k = 1 : n)
        suma = 0;
        for (p = 1 : k - 1)
            suma = suma + L(k, p) * U(p, k);
        end
        L(k, k)= sqrt(A(k, k) - suma);
        U(k, k) = L(k, k);
        
        for (i = k : n)
            suma2 = 0;
            for (p = 1 : k - 1)
                suma2 = suma2 + L(i, p) * U(p, k);
            end
            L(i, k) = (A(i, k) - suma2) / L(k, k);
        end

        for (j = k : n)
            suma3 = 0;
            for (p = 1 : k - 1)
                suma3 = suma3 + L(k, p) * U(p, j);
            end
            U(k, j)= (A(k, j)- suma3) / L(k, k);
    end

    %L, U
    y = sust_adelante(L,b);
    x = sust_atras(U,y);
end

% A = [25, 15, -5, -10; 15, 10, 1, -7; -5, 1, 21, 4; -10, -7, 4, 18]
% b = [-25; -19; -21; -5]


% x = cholesky(A, b)