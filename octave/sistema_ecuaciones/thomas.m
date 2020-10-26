function x = thomas(A, d)
    [m, n] = size(A);

    if (m != n)
        display("La matriz no es cuadrada.")
        x = 0;
        return;
    end

    if( det(A) == 0)
        display("La matriz no es invertible.")
        x = 0;
        return;
    end

    if (isbanded(A,1,1) == 0)
        display("La matriz no es tridiagonal.")
         x = 0;
        return;
    end

    a = [0];
    a = [a diag(A, -1)'];

    b = [diag(A)'];

    c = [diag(A, 1)'];
    c = [c 0];

    d = d';

    w(1) = b(1);
    g(1) = d(1) / w(1);

    for (i = 2 : n)
        w(i) = b(i) - a(i) * c(i - 1) / w(i - 1); 
        g(i) = (d(i) - a(i) * g(i - 1)) / w(i);
    end

    x(n) = g(n); 

    for (i = n - 1 : -1 : 1)
        x(i) = g(i) - c(i)*x(i+1)/w(i);
    end
    
end

% A = [7, 5, 0, 0; 2, -8, 1, 0; 0, 6, 4, 3; 0, 0, 9, 8]
% d = [6; 5; 7; 8]

    % a = [0; -1; 2; 1]
    % b = [1; 4; 1; 2]
    % c = [2; 3; 1; 0]
    % d = [1; 1; 1; 1]

    % a = [0, 1, 2, 1, 2, 1]  
    % b = [5, 3, 4, 2, 3, 2]  
    % c = [4, 1, 1, 1, 2, 0]
    % d = [13, 10, 20, 16, 35, 17]

    % a = [0 2 6 9];
    % b = [7 -8 4 8];
    % c = [5 1 3 0];
    % d = [6 5 7 8];

% x = thomas(A, d)