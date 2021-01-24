function S = trazadores_cubicos(vx, vy)
    % Delcaracion: Variable Literal 'x' %
    syms x;

    % Calculo: Dimension de los Vectores %
    len_vx = length(vx);
    len_vy = length(vy);   
    
    % Verificacion: Ambos Largos deben Coincidir %
    if (len_vx !=  len_vy)
        dislpay("Los dos vectores deben contener el mismo numero de elementos.");
    end

    % Asignacion: 'n' como variable de limite %
    n = len_vx;
    n

    % --------------------- %
    % Paso 1: Calcular 'hi' %
    % --------------------- %

    hi = zeros(1, (n - 1));

    %for (i = 1 : (len_vx -1))
        %h(i) = x(i+1) - x(i);
    %end

    hi = vx(2 : n) - vx(1 : (n - 1));

    hi

    % --------------------- %
    % Paso 2: Calcular 'ui' %
    % --------------------- %
    ui = zeros(1, n - 2);

    for (i = 1 : (n - 2))
        %frac_1 = ((vy(i + 2) - vy(i + 1)) / hi(i + 1));
        %frac_2 = ((vy(i + 1) - vy(i)) / hi(i));
        %ui_t = 6 * (frac_1 - frac_2);
        ui_t = 6 * (((vy(i + 2) - vy(i + 1)) / hi(i + 1)) - ((vy(i + 1) - vy(i)) / hi(i)));
        ui(i) = ui_t;
    end
    
    ui

    % ---------------------------------- %
    % Paso 3: Construir Matriz A 'mat_A' %
    % ---------------------------------- %
    dim_A = n - 2;

    A = zeros(dim_A, dim_A);
    for(i = 1 : dim_A)
        for (j = 1 : dim_A)
            if (i == j)
                A(i, j) = 2 * (hi(i) + hi(i + 1));
            end
        end
    end

    diag_sup = diag(A, 1);
    for (i = 1 : length(diag_sup))
        diag_sup(i) = hi(i + 1);
    end 

    diag_inf = diag(A, -1);
    for (i = 1 : length(diag_inf))
        diag_inf(i) = hi(i + 1);
    end 

    mat_A = diag(diag_sup, 1) + diag(diag(A)) + diag(diag_inf, -1);
    mat_A
    
    % ------------------------------------------------------------ %
    % Paso 4: Solucion (mat_A * m = ui) con Metodo de Thomas = 'M' %
    % ------------------------------------------------------------ %
    M = thomas(mat_A, ui');
    M

    % Mi(0) = M(n) = 0  => Frontera Natual o Libre%
    M = [0 M];
    M = [M 0];
    M

    % ------------------------------------------------- %
    % Paso 5: Calculo Constantes 'ai', 'bi', 'ci', 'di' %
    % ------------------------------------------------- %
    ai = [];
    bi = [];
    ci = [];
    di = [];

    for (i = 1 : (n - 1))
        ai(i) = (M(i + 1) - M(i)) / (6 * hi(i));
        bi(i) = M(i) / 2;
        ci(i) = ((vy(i + 1) - vy(i)) / (hi(i))) - ((hi(i) / 6) * (M(i + 1) + (2 * M(i))));
        di(i) = vy(i);
    end

    ai
    bi
    ci
    di

    % ------------------------------- %
    %     Paso 6: Calcular 'si(x)'    %
    %               +                 %
    % Paso 7: Agregarlo al Vector 'S' %
    % ------------------------------- %
    S = [];

    for (i = 1 : (n - 1))
        si = (ai(i) * (x - vx(i))^3) + (bi(i) * (x - vx(i))^2) + (ci(i) * (x - vx(i))) + (di(i));
        si_simp = simplify(si)
        S = [S si_simp];
    end;

    S

    for (i = 1: length(S))
        ezplot(S(i))
    end


end

% vx = [1, 1.05, 1.07, 1.1]
% vy = [2.718282, 3.286299, 3.527609, 3.905416]

% S = trazadores_cubicos(vx, vy)