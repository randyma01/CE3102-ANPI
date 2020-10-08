function [x] = e_gauss(A,b)

    len_A = size(A);
    s = size(A);

    % verifica que sea cuadrada
    if (s(1)!= s(2))
        display('A no es nxn');
        clear x;
        return;
    end

    % verifica que haya un vector de igualdad
    n = s(1);
    if n~=s(1)
        display('b no es vector columna.');
        return;
    end
    
    %columan a de ceros
    x = zeros(n,1);

    % matriz aumentada
    mat_aum = [A b]

    % copia de la matriz
    temp_mat = mat_aum;

    for (i = 2 : len_A(1) )
        temp_mat(1,:) = temp_mat(1,:)/max(temp_mat(1,:))
        temp = find(abs(temp_mat) - max(abs(temp_mat(:,1))));

        if (2 < length(temp))
            for ( j = 1 : length(temp) - 1)
                if (j != temp(j))
                    maxi = j; 
                    break;
                end
            end
        else 
            maxi = 1;
        end

        if (maxi!= 1)
            temp = temp_mat(maxi,:);
            temp_mat(maxi,:) = temp_mat(1,:);
            temp_mat(1,:) = temp;
        end

        for j=2:length(temp_mat)-1
            temp_mat(j,:) = temp_mat(j,:)-temp_mat(j,1)/temp_mat(1,1)*temp_mat(1,:);
            if temp_mat(j,j)==0 || isnan(temp_mat(j,j)) || abs(temp_mat(j,j))==Inf
                fprintf('Error.\n');
                clear x;
                return
            end
        end
        mat_aum(i-1:end,i-1:end) = temp_mat;
        temp_mat = temp_mat(2:end,2:end);
    end

    x(end) = mat_aum(end,end)/mat_aum(end,end-1);
    for i=n-1:-1:1
        x(i) = (mat_aum(i,end)-dot(mat_aum(i,1:end-1),x))/mat_aum(i,i);
    end
 
end

% x = e_gauss([1 -1 5;0 3 13;0 0 -13],[7; 13;-13])