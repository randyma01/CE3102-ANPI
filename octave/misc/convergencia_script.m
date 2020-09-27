clc; clear; close all;

%g = @(x) (exp(x) - 1)  / 2;

g = @(x) log(2*x + 1)

x0 = 1.5;

x = x0;

for i = 1:10
    x = g(x)
end
