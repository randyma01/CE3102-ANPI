function [x] = thomas(A, b)  

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

    if (vf_det_sub(A) != 1)
        display("No cumple la condicion de determinantes de las submatrices.")
        x = 0;
        return;
    end
 
    n = size(a, 1);   %Recupera ordem do sistema.  
    x = zeros(n, 1);  %Inicializa x  
    
    c(1)=c(1)/b(1);  
    for i=2:n-1  
        c(i)=c(i)/(b(i)-a(i)*c(i-1));  
    end  
    
    d(1)=d(1)/b(1);  
    for i=2:n  
        d(i)=(d(i)-a(i)*d(i-1))/(b(i)-a(i)*c(i-1));  
    end  
    
    x(n)=d(n);  
    for i=n-1:-1:1  
        x(i)=d(i)-c(i)*x(i+1);  
    end  
end

% A = [1, 2, 0, 0; -1, 4, 3, 0; 0, 2, 1, 1; 0, 0, 1, 2]
% b = [1; 1; 1; 1]

    % a = [0, -1, 2, 1]
    % b = [1, 4, 1, 2]
    % c = [2, 3, 1, 0]

% x = thomas(a, b, c, d)

% x = thomas(A, b)