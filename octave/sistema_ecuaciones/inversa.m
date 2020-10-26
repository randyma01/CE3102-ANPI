function x = inversa(A,b)
    [row, col] = size(A);
    AT = A';
    r = row;
    c = col;
    s = zeros(r,c);

    for (i = 1: r)
        for (j = 1 : c)
            s(i, j) = ((-1)^(i + j)) * det(AT (setdiff(1 : end, i), setdiff(1 : end, j)));
        end
    end
    
    q = s / det(A);
    x = q * b;
end

% A = [1, -1, 5; 0, 3, 13; 0, 0, -13]
% b = [-7; 13; -13]
% x = inversa(A, b)