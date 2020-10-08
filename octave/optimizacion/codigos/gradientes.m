function [gr] = gradientes(f, vars)
    pkg load symbolic

    %fs = sym(f);

    var_val = []

    for (n = 1: length(vars))
        if (vars(n) =! " ")
        x = vars(n)
            
        temp_n = num2str(n)
        temp_val = strcat(xk, temp_n)
        temp_val = vars(n) 
    end

    %gr = gradient(fs, vars);

end

% [g] = gradientes( (x^2) + x * y, ["x,y"])
