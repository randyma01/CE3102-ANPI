function [xk, k, err] = relajacion(A, b, x0, w, tol)

    err = tol + 1;
    xk = x0;
    k = 0;
    
    D = diag(diag(A));
    
    L = tril(A) - D;
    
    U = A - tril(A);
    
    M = (1 / w) * (w .* L + D);
    
    N = (1/w)*((1-w).*D - w.*U);

    y = sust_adelante(M, b);

    while(tol < err)
        r = N * xk;
        yk = sust_adelante(M, r);
        xk = yk + y; 
        err = norm(A * xk - b);
        ++k;
    end
    
end

% A = [4,3,0;3,4,-1;0,-1,4]
% b = [7;7;-1]
% x0 = [0;0;0]
% w = 1.5
% tol = 10^-8
% [xk, k, err] = relajacion(A, b, x0, w, tol)