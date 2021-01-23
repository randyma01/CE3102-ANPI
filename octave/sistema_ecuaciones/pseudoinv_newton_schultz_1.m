% Resolver un Problema min_x ||Ax - b|| ** %

% Comandos de Limpieza %
close all;
clear;
clc;

A = [4, 2; -5, 3; 0, 1; 4, 1; 3, 0];
b = [1; -1; 2; -2; 3];

% Calcular Pseudoinversa de A %
% Ap = pinv(A); % este es un commando propio de octave %

% Metodo de Newton-Schultz %

% Valor Inicial X0 %
x0 = (1 / norm(A)^2) * A';

% Vector Resultante %
xk = x0;

for (i = 1 : 10)
    xk = xk * (2* eye(5) - A * xk);
end

% Norma  %
err = norm(A * xk * A - A, 'fro')

% Pseudoinversa %
Ap = xk

% Aproximar la Solucion %
 x = Ap * b

% Error %
error = norm(A * x - b)