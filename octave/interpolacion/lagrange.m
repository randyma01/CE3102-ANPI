function pn = lagrange(vx,vy)
    syms x;
    vx_len = length(vx);
    vy_len = length(vy);
    n = length(vx) - 1;
    pn = 0;
    
    if (vx_len !=  vy_len)
        dislpay("Los dos vectores deben contener el mismo numero de elementos.");
    end
    
    for (k = 0 : n)
        pn = pn + vy(k + 1) * lagrange_aux(vx, k);
    end

    pn = simplify(pn);
    % ezplot(pn);

end

% px = [-2, 0, 1]
% py = [0, 1, -1]

% pn = lagrange(px, py)