% '2*x + 1'
clc; clear; close all;

pkg load symbolic

syms x

%f0 = 2*x + 1

f1 = sym(2*x + 1)

f2 = matlabFunction(f1) 

disp(["Evaluando f(2): "])

f2(2)


    
%df = matlabFunction(diff(sym(f1)));

