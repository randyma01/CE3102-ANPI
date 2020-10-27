close all;
clear;
clc;
  

 %A = [5,1 ,1; 1, 5, 1; 1, 1, 5];
 %A = [-10, 3, 0, 0; 4, 15, 2, 1; 3, 8, -21, 4; 1, 1, 1, 4]

%A = [2, -10, 3; 10, 3, 1; 0, -1, 2];
%A = [10, 3, 1; 2, -10, 3; 0, -1, 2];
%A = [5, 1 ,1; 1, 5, 1; 1, 1, 5];

%b = [7; 7; 7];

A = [15, -3, -1; -3, 18, -6; -4, -1, 12;]

b = [3800; 1200; 2350];

x = jacobi(A, b)

%[m, n] = size(A);

%if (!vf_diag_dom(A, m))
%    display("no")
%else
%    display("si")
%end

%for (r = 1 : size(A, 1))
%     elemento_diagonal = abs(A(r,r))
%     suma = sum(abs(A(r, :))) - elemento_diagonal
%
%    if (suma < elemento_diagonal)
%        display("si")
%        continue
%    else
%        display("no")
%        break;
%    end
%end

% A = [7, 5, 0, 0; 2, -8, 1, 0; 0, 6, 4, 3; 0, 0, 9, 8]
% d = [6; 5; 7; 8]


%egauss = e_gauss(A, d)
%choles = cholesky(A, d)
%invers = inversa(A, d)
%thomas = thomas(A, d)
%factlu = fact_lu(A, d)