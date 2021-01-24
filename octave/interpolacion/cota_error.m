close all;
clear;
clc;
  
pkg load symbolic
syms x

s = [1 2 3 4 5]

pn = 1

for (i = 1 : length(s))
    pn = pn * (x - s(i))
end