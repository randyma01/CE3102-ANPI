close all;
clear;
clc;

% Datos de Entrada %
vx = [1, 1.05, 1.07, 1.1];
vy = [2.718282, 3.286299, 3.527609, 3.905416];

vx_len = length(vx);
vy_len = length(vy);    

if (vx_len !=  vy_len)
    dislpay("Los dos vectores deben contener el mismo numero de elementos.");
end

n = vx_len;

n

% Paso 1: Calcular hi %
hi = zeros(1, (n - 1));

hi = vx(2 : n) - vx(1 : (n - 1));

hi

% Paso 2: Calcular ui %
ui = zeros(1, n - 2);

for (i = 1 : (n - 2))
    frac_1 = (vy(i + 2) - vy(i + 1)) / hi(i + 1);
    frac_2 = (vy(i + 1) - vy(i)) / hi(i);
    ui_t = 6 * (frac_1 - frac_2);
    ui(i) = [ui_t];
end

ui

% Paso 3: Construir Matriz A %
dim_A = n - 2;

A = zeros(dim_A, dim_A);
for(i = 1 : dim_A)
    for (j = 1 : dim_A)
        if (i == j)
            A(i, j) = 2 * (hi(i) + hi(i + 1));
        end
    end
end

A

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


% Paso 4: Solucion (mat_A * m = ui) %
M = thomas(mat_A, ui');
M

% Paso 5: Calculo Constantes ai, bi, ci, di %
ai = [];
bi=  [];
ci= [];
di =[];

for (i = 1 : (n - 1))
    %a(i) = [(M(i + 1) - M(i)) - (6 * hi(i))]; 
end
