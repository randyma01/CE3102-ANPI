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

dk = - gk;

% iteraciones 
iter = 10;

for (i = 1 : iter)

    % calcular el xk
    x_t = [xk; yk]';

    % calcular z_t = x_t + alpha * dk
    z_t = x_t + ak * dk...m

    % calculcar el alpha_k
    ak = 1;

    % calcular el delta
    delta = rand(1);

    % parte de la izquierda
    izq = subs(fs, [x y], [sym(z_t(1, 'r') sym(z_t(2, 'r')))])

    % calcular el xk y yk (x_t = [xk yk]^T)
    x_t = x_t + ak * dk;

    % actualizar el dk para la siguiente iteraciones d^(k + 1) = -g^(k+1) + betak * d^(k)
    gk_new = double(subs(gr, [x y], [sym(x_t(1),'r') sym(x_t(2), 'r')]));
    
    % beta
    beta = norm(gk_new)^2/norm(gk)^2;

    dk = -gk_new + beta * dk;

    gk = gk_new;

    display(x_t')
end