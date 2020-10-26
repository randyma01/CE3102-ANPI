close all;
clear;
clc;

A = [5,1 ,1; 1, 5, 1; 1, 1, 5];
b = [7; 7; 7];



x = jacobi(A, b)

%A = [7, 5, 0, 0; 2, -8, 1, 0; 0, 6, 4, 3; 0, 0, 9, 8]
%d = [6; 5; 7; 8]


%egauss = e_gauss(A, d)
%choles = cholesky(A, d)
%invers = inversa(A, d)
%thomas = thomas(A, d)
%factlu = fact_lu(A, d)