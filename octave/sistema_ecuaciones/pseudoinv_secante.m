% comandos de limpieza %
%close all;
%clear;
%clc;

% Metodo para Calcular la Pseudoinversa de una Matriz basado  %
% en la Formula de la Secante para Aproximar un Cero de la    %
% Funcion No Lineal                                           %

% Matriz A %
A = [4, 2; -5, 3; 0, 1; 4, 1; 3, 0];

% Valores de Alpha 1 y Alpha 2 %
alpha_1 = 5 * 10^-10;
alpha_2 = 2 * 10^-11;

% Valores Iniciales %
x0 = alpha_1 * A';
x1 = alpha_2 * A';

% Tolerancia %
tol = 10^-5;

% Error %
err = tol + 1;

% Iteracion para hallar la Pseudoinversa %
while (tol < err)
    xk = x0 + x1 - x0 * A * x1;
    x0 = x1;
    x1 = xk;
    err = norm(A * xk * A - A, 'fro');
end

% Impresion de la Pseudoinversa y el Error %
A
err
xk
