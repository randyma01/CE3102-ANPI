function  x = fact_lu(A, b)
    [m, n] = size(A);

   if (m != n)
        display("La matriz no es cuadrada.")
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

    for (i = 1: m)    
        if (U(i, i) == 0)
            maximum = max(abs(U(i : end, 1)))
            maximum
            for (k = 1 : n)
               if (maximum == abs(U(k, i)))
                   temp = U(1, :);
                   U(1, :) = U(k, :);
                   U(k, :) = temp;
                   temp = P(: ,1);
                   P(1, :) = P(k, :);
                   P(k, :) = temp;
               end
            end
        end

        if (U(i, i) != 1)
            temp = eye(n);
            temp(i, i)=U(i, i);
            L = L * temp;
            U(i, :) = U(i, :) / U(i, i);
        end

        if (i != m)
            for (j = i + 1:length(U))
                temp = eye(n);
                temp(j, i) = U(j, i);
                L = L * temp;
                U(j, :) = U(j, :) - U(j, i) * U(i, :);
            end
        end
    end

    %L, U
    y = sust_adelante(L,b);
    x = sust_atras(U,y);
end

% A = [4, -2, 1; 20, -7, 12; -8, 13, 17]
% b = [11; 70; 17]

% A = [2, 3, 4; 4, 5, 10; 4, 8, 2]
% b = [6; 16; 2]

% x = fact_lu(A, b)