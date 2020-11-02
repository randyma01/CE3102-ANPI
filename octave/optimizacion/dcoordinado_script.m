% limpiando 
clc;
clear; 
close all;

% importando el paquete simbolico
pkg load symbolic

% funcion a minimizar
f=@(x, y, z) x^3 + y^3 + z^3 - 2 * (x * y + x * z + y * z); 

% variables simbolicas
syms x y z

% funcion f simbolica
fs = sym(f);

% gradiente de la funcion
gr = gradient(fs, [x, y, z]);

% valores iniciales
xk = 1;
yk = 1;
zk = 1; 

% iteraciones
iter = 10;

% vector de error
e = [];

for (i = i : iter)
    % actulizar el valor de xk, minimizando f(x, yk, zk)
    fx = @(x) f(x, yk, zk);
    xk = fminsearch(fx, xk);

    % actulizar el valor de yk, minimizando f(xk, y, zk)
    fy = @(y) f(xk, y, zk);
    yk = fminsearch(fy, yk);

    % actulizar el valor de zk, minimizando f(xk, yk, z)
    fz = @(z) f(xk, yk, z);
    zk = fminsearch(fz, zk);

    % vector
    display([i xk yk zk])

    %% evaluar el punto (xk, yk, zk) en el gradiente y calcular su norma %%
    
    % evaluar el grandiente
    p1 = subs(gr, [x y z], [sym(xk, 'r') sym(yk, 'r') sym(zk, 'r')]); 
    p2 = double(p1); % convertir en double

    % calcular la norma
    error = norm(p2); 

    % actualizando vector del errror
    e = [e error]; 

end

% grafica del error
plot(1 : iter, error)