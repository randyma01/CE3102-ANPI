close all;
clear;
clc;


%A = fix(rand(4, 4) * 10)

A = [7, 5, 0, 0; 2, -8, 1, 0; 0, 6, 4, 3; 0, 0, 9, 8]
d = [6; 5; 7; 8];


a = [0];
a = [a diag(A, -1)']

b = [diag(A)']

c = [diag(A, 1)'];
c = [c 0]

d'

x = thomas(A, d)