% limpiando 
clc;
clear; 
close all;

% importando el paquete simbolico
pkg load symbolic

% funcion a minimizar -> criterio
f=@(x, y) (x - 2)^4 + (x - 2 * y)^2;

% variables simbolicas
syms x
syms y 

% funcion f simbolica
fs = sym(f);

% gradiente de la funcion
gr = gradient(fs, [x y]);

% valores iniciales -> x_t = [xk yk]^t = [0 3]^t
xk = 0;
yk = 3;

% Paso 0: Definir g^k y d^k, con k = 0

gk = double(subs(gr, [x y], [sym(xk,'r') sym(yk, 'r')])); % en octave obtengo un vector columna

% transpuesta
dk = -gk;

% iteraciones 
iter = 5;

for (i = 1 : iter)
    % Calcular el valor de alpha_k
    ak = 1;

    x_t = [xk yk]';

    % calcular z_t = x_t + alpha * dk
    z_t = x_t + ak * dk;

     % Calcualr el valor de delta, de manera aleatoria 
    delta = rand(1);
    
    % calculo de la desigualdad
    izq = double(subs(fs, [x y], [sym(z_t(1), 'r') sym(z_t(2), 'r')])) - double(subs(fs, [x y], [sym(x_t(1), 'r') sym(x_t(2), 'r')]));
    der = delta * ak * gk' * dk;

    k = 0
    while(izq > der)
        k
        ak = ak/10;
        z_t = x_t + ak * dk;
        izq = double(subs(fs, [x y], [sym(z_t(1), 'r') sym(z_t(2), 'r')])) - double(subs(fs, [x y], [sym(x_t(1), 'r') sym(x_t(2), 'r')]));
        der = delta * ak * gk' * dk;
        ++k;
    end

    % calcular el xk y yk (x_t = [xk yk]^T)
    x_t = x_t + (ak * dk);

    % actualizar el dk para la siguiente iteraciones d^(k + 1) = -g^(k+1) + betak * d^(k)
    gk_new = double(subs(gr, [x y], [sym(x_t(1), 'r') sym(x_t(2), 'r')]));

    % calcular el valor de beta
    beta = norm(gk_new)^2/norm(gk)^2;

    dk = -gk_new + beta * dk;

    % actualizando la nueva iteracion
    gk = gk_new;

    % evaluar el grandiente
    p1 = subs(gr, [x y], [sym(x_t(1), 'r') sym(x_t(2), 'r')]);
    p2 = double(p1); % convertir en double

    % calcular la norma
    error = norm(p2); 

    % actualizando vector del errror
    e = [e error]; 
    display(x_t');
end

% grafica del error
plot(1 : iter, error)