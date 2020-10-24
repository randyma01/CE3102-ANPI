function x = e_gauss(A,b)
    [m, n] = size(A);

    if (m != n)
        display("La matriz no es cuadrada")
         x = 0;
        return;
    end

    n = length(b); 
    x = zeros(n, 1);
    mat_aug = [A b];

    for (j = 1 : n - 1)
        for (i = j + 1 : n)  
            if (A(i, j) != 0)  
                lambda = A(i, j) / A(j, j);  
                A(i, j + 1 : n) = A(i, j + 1 : n) - (lambda * A(j, j + 1 : n));  
                b(i)= b(i) - (lambda * b(j));  
        end  
    end

    %A, b
    x = sust_atras(A, b);  
    end
end

% A = [2, -6, 12, 16; 1, -2, 6, 6; -1, 3, -3, -7; 0, 4, 3, -6]
% b = [70; 26; -30; -26]


% A = [1, -1, 5; 0, 3, 13; 0, 0, -13]
% b = [7; 13; -13]

% A = [1, 1, -1, 3; 0, -1, -1, -5; 0, 0, 3, 13; 0, 0, 0, 13]
% b = [4; 7; 13; -13]

% x = e_gauss(A, b)