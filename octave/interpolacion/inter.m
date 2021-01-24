close all;
clear;
clc;
  
pkg load symbolic
syms x

%px = [-2, 0, 1]
%py = [0, 1, -1]

%pn_lg = lagrange(px, py)
%pn_dd = dif_div(px, py)

f = @(x) sin((x*pi)/2)
px = [-1, 0, 1, 2]
py = f(px)

%pn_lg = lagrange(px, py)
%pn_dd = dif_div(px, px)

fs = sym(f)

d1 = diff(fs)
d2 = diff(d1)
d3 = diff(d2)
d4 = diff(d3)