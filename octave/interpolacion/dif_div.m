function alphas = dif_div (vx, vy)
    vx_len = length(vx);
    vy_len = length(vy);
    
    if (vx_len !=  vy_len)
        dislpay("Los dos vectores deben contener el mismo numero de elementos.");
    end

    n = vx_len;

    alphas = vy;

    for (j = 2 : n)
        for (i =  n : -1 : j)
            alphas(i) = (alphas(i) - alphas(i-1)) / (vx(i) - vx(i - j + 1));
        end
    end

end
    
% px = [1, 1.5, 2, 3]
% py = [2.71, 2.98, 3.2, 3.2]

% pn = dif_div(px, py)
