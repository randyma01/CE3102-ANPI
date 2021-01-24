function pn = lagrange(vx, vy)
    syms x;
    len_vx = length(vx);
    len_vy = length(vy);
    n = length(vx) - 1;
    pn = 0;
    
    if (len_vx !=  len_vy)
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