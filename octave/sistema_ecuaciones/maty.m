close all;
clear;
clc;


%A = fix(rand(4, 4) * 10)

A = [1, 2, 0, 0; -1, 4, 3, 0; 0, 2, 1, 1; 0, 0, 1, 2]


a = [0];
a = [a diag(A, -1)']';

b = [diag(A)']';

c = [diag(A, 1)'];
c = [c 0]';

a, b, c

% vector a: diagonal adaycente inferior
%a = [0]
%for (i = 2: m - 1)
%    a = [a A(i, i)];
%end


% vector b: diagonal
%for (i = 1 : m)
%    b = [b A(i, i)];
%end

% vector c: diagonal adaycente superior
%for (i = 1 : 2 : n)
%    c = [c (A(i, j))];
%end

%c = [c 0]
