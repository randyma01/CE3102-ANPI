function L = lagrange_aux(vx, k)
    syms x;
    n = length(vx) - 1;
    L = 1;  
    
    for (j = 0 : n)
        if (j != k)
            L = L * (x - vx(j + 1)) / (vx(k + 1) - vx(j + 1));
        end
    end
    L = simplify(L);
end
    