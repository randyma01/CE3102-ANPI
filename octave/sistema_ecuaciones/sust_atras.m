function x = sust_atras(A, b)
    n = length(b); 
    x = zeros(n, 1);  
    x(n) = b(n) / A(n,n);
    for (i = n : -1 : 1)
        suma = 0;
        for (j = i + 1 : n)
            suma = suma + A(i, j) * x(j);
        end
    x(i) = (b(i) - suma) / A(i, i);
end

% A = [1, 1, -1, 3; 0, -1, -1, -5; 0, 0, 3, 13; 0, 0, 0, -13]
% b = [4; -7; 13; -13]
% x = sust_atras(A, b)


%for (i = n : -1 : 1)
%        x(i) = (b(i) - A(i, (i + 1) : n) * x( (i + 1) :n)) / A(i,i);  
%end 