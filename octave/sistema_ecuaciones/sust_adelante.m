function x = sust_adelante(A, b)
    n = length(b); 
    x = zeros(n, 1)
    x(1) = b(1) / A(1,1)  
    for ( i = 2 : n)
        suma = 0;
        for  (j = 1 : (i - 1))
            suma = suma + A(i, j) * x(j);
    end
    x(i) = (b(i) - suma) / A(i, i);
end



% A = [4,0,0,0,0,0;51,23,0,0,0,0;34,12,15,0,0,0;2,6,4,23,0,0;56,23,41,16,19,0;65,34,27,98,12,11]
% b = [8; 194; 206; 236; 768; 1464]

% A = [2, 0, 0, 0, 0; 3, 2, 0, 0, 0; 3, -1, -1, 0, 0; 1, 1, 1, -1, 0; 1, 2, 3, -1, 1]
% b = [-8; 10; 2; 1; 3]

% x = sust_adelante(A, b)