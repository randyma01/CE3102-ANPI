function [M, N] = desc_MN_jacobi(A)

    % A = M - N
    % M = diagonal de A
    % N = M - A

    M = diag((diag(A)));
    N = M - A;
  
end