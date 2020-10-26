% Esta funcion verifica que una matriz sea del
% tipo: diagonalmente dominante. 
%
% Es decir, el valor absoluto del elemento de
% la diogonal, es mayor a la suma de los 
% valores en valor absoluto del resto de la 
% fila.
%
% Firma: bool = vf_diag_dom(A,b)
% 
% Entradas: 
%   A = matriz de coeficientes
%   m = cantidad de filas 
%            
% Salida:                           
%   bool = valor booleano (1 o 0)

function bool = vf_diag_dom(A, m)
    bool = 0;

    for (i = 1 : m)
        ed = abs(A(i, i));
        suma = sum(abs(A(i, :))) - ed;
        if (suma < ed)
            bool = 1;
            continue;
        else
            bool = 0;
            break;
        end
    end
end