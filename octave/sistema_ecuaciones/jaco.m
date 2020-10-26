close all;
clear;
clc;

% Paso 1: Crear una matriz A y vecotr balance

A = [5,1 ,1; 1, 5, 1; 1, 1, 5]
b = [7, 7, 7]'

% Paso 2: Definir el vector inicial
x0 = [0, 0, 0]'

% Paso 3: Calcular M, N, donde (A = M - N), usando al regla de Jacobi
%[M, N] = desc_MN_jacobi(A)
M = diag((diag(A)));
N = M - A;

% Paso 4: Calcular la inversa de M
d = diag(M)
Minv = diag(1./d)

% Paso 5: Realizar el metodo iterativo. 

xk = x0;

% Paso 6: Comportamiento del Error
e = [];


for(i = 1 : 20) % while con una tol, tal que: (tol < error)
    xk = (Minv * N * xk) + (Minv * b);
    error = norm(A * xk - b, 'Inf')
    %error = norm(A * xk - b);
    e = [e error];
end

plot(1 : i, e)
xlabel('iter (k)')
ylabel('Error (|f(x_k)|)')
xk

