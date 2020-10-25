function [x] = thomas(A, d)
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

     if (isbanded(A,1,1) == 0)
        display("La matriz no es tridiagonal.")
         x = 0;
        return;
    end

    A

    a = [0];
    a = [a diag(A, -1)'];

    b = [diag(A)'];

    c = [diag(A, 1)'];
    c = [c 0];

    d = d';

    x = zeros(n, 1);  
    
    c(1) = c(1) / b(1);  

    for (i = 2 : n - 1)  
        (b(i) - a(i) * c(i - 1))  
        c(i) = c(i) / (b(i) - a(i) * c(i - 1))  
    end  

    d(1) = d(1) / b(1);

    for (i = 2 : n)  
        d(i) = (d(i) - a(i) * d(i - 1)) / (b(i) - a(i) * c(i - 1));  
    end  

    x(n) = d(n); 

    for (i = n - 1: -1 : 1) 
        x(i) = d(i) - c(i) * x(i + 1);  
    end  
end

% A = [1, 2, 0, 0; -1, 4, 3, 0; 0, 2, 1, 1; 0, 0, 1, 2]
% d = [1; 1; 1; 1]

    % a = [0; -1; 2; 1]
    % b = [1; 4; 1; 2]
    % c = [2; 3; 1; 0]
    % d = [1; 1; 1; 1]

    % a = [0, 1, 2, 1, 2, 1]  
    % b = [5, 3, 4, 2, 3, 2]  
    % c = [4, 1, 1, 1, 2, 0]
    % d = [13, 10, 20, 16, 35, 17]


% x = thomas(a, b, c, d)

% x = thomas(A, d)