close all;
clear;
clc;
  
pkg load symbolic
syms x

x = [-2, 0, 1]
y = [0, 1, -1]

pn_lg = lagrange(x, y)
%pn_dd = dif_div(x, y)

%f = @(x) sin((x*pi)/2)
%x = [-1, 0, 1, 2]
%y = f(px)

%pn_lg = lagrange(x, y)
%pn_dd = dif_div(px, y)

%fs = sym(f)

%d1 = diff(fs)
%d2 = diff(d1)
%d3 = diff(d2)
%d4 = diff(d3)