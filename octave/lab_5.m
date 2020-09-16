clc;
clear;
close all;

pkg load symbolic;

syms x;

[diff_f]=lab_4('@(x)-x-2')