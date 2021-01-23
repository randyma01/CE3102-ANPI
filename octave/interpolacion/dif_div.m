function alphas = dif_div (vx, vy)
    syms x;
    vx_len = length(vx);
    vy_len = length(vy);
    
    if (vx_len !=  vy_len)
        dislpay("Los dos vectores deben contener el mismo numero de elementos.");
    end

    alphas = vy;

    for (j = 2 : vx_len)
        for (i =  vx_len : -1 : j)
            alphas(i) = (alphas(i) - alphas(i-1)) / (vx(i) - vx(i - j + 1));
        end
    end

    pn = [];
    alphas_len = length(alphas);
end
    
% px = [1, 1.5, 2, 3]
% py = [2.71, 2.98, 3.2, 3.2]

% pn = dif_div(px, py)
