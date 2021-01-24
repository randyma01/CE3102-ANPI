function s = trazadores_cubicos(vx, vy)
    syms x;
    vx_len = length(vx);
    vy_len = length(vy);    
    
    if (vx_len !=  vy_len)
        dislpay("Los dos vectores deben contener el mismo numero de elementos.");
    end
    
    % Paso 1: Calcular hi %
    hi = zeros(1, (vx_len - 1));
    hi = vx(2 : vx_len) - vx(1 : (vx_len - 1))

    %for (i = 1 : (vx_len -1))
        %h(i) = x(i+1) - x(i);
    %end

    % Paso 2: Calcular ui %
    ui = zeros(1, vy_len - 2);
    for (i = 1 : (vy_len - 2))
        rac_1 = (vy(i+2) - vy(i+1)) / hi(i+1);
        frac_2 = (vy(i+1) - vy(i)) / hi(i);
        ui_t = 6 * (frac_1 - frac_2);
        ui(i) = [ui_t];
    end

    % Paso 3: Construir Matriz A %
    A = zeros(vx_len, vx_len);

    for(i = 1 = (vx_len - 1))
        for (j = 1 : (vx_len - 1))
            A(i, j) = 2(h(i) + h(i+1))
        end
    end



end
