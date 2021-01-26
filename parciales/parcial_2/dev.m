close all;
clear;
clc;

pkg load symbolic

syms x

%f = @(x) (1-2^((0.5 * x) + 1)) / 5

%a = f(0)
%b = f(1)

%fs = sym(f)

%df1 = diff(fs)
%df2 = diff(df1)
%df3 = diff(df2)

%solve(0 == abs(df3))


f = @(x) x^3 - (3/2)*x^2 + 0.5 * x

fs = sym(f)

df1 = diff(fs)
df2 = diff(df1)
df3 = diff(df2)

solve(0 == abs(df3))