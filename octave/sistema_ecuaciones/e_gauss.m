function x = e_gauss(A,b)

    dim = size(A);

    if (dim(1) != dim (2))
        display("La matriz no es cuadrada")
        return;
    end

    n = length(b); 
    x = zeros(n, 1);

    mat_aug = [A b];

    for (j = 1 : n - 1)
        for (i = j+1 : n)  
            if (A(i, j) != 0)  
                lambda = A(i, j) / A(j, j);  
                A(i, j + 1 : n) = A(i, j + 1 : n) - (lambda * A(j, j + 1 : n));  
                b(i)= b(i) - (lambda * b(j));  
        end  
    end
    x = sust_atras(A, b);  
    end
end
% A = [2, -6, 12, 16; 1, -2, 6, 6; -1, 3, -3, -7; 0, 4, 3, -6]
% b = [70; 26; -30; -26]
% x = e_gauss(A, b)