function [x]=eGauss(A,b)
    %Esta función obtiene una solucion directa al sistema de ecuaciones Ax=b por medio de Eliminacion
    %Gaussiana
    %
    %Sintaxis: eGauss(A,b)
    % 
    %Parámetros Iniciales: 
    %            A = Matriz de coeficientes
    %            b = vector terminos independientes
    %            
    %            
    %Parámetros de Salida:                           
    %            x=vector de incognitas
    
    s = size(A);
    if s(1)~=s(2)
        fprintf('A no es nxn');
        clear x;
        return;
    end
    n = s(1);
    if n~=s(1)
        fprintf('b no es vector columna');
        return
    end
    x = zeros(n,1);
    aug = [A b];
    tempmatrix = aug;
    for i=2:s(1)
        tempmatrix(1,:) = tempmatrix(1,:)/max(tempmatrix(1,:));
        temp = find(abs(tempmatrix) - max(abs(tempmatrix(:,1))));
        if length(temp)>2
            for j=1:length(temp)-1
                if j~=temp(j)
                    maxi = j; 
                    break;
                end
            end
        else 
            maxi=1;
        end
        if maxi~=1
            temp = tempmatrix(maxi,:);
            tempmatrix(maxi,:) = tempmatrix(1,:);
            tempmatrix(1,:) = temp;
        end    
        for j=2:length(tempmatrix)-1
            tempmatrix(j,:) = tempmatrix(j,:)-tempmatrix(j,1)/tempmatrix(1,1)*tempmatrix(1,:);
            if tempmatrix(j,j)==0 || isnan(tempmatrix(j,j)) || abs(tempmatrix(j,j))==Inf
                fprintf('Error.\n');
                clear x;
                return
            end
        end
        aug(i-1:end,i-1:end) = tempmatrix;
        tempmatrix = tempmatrix(2:end,2:end);
    end

    x(end) = aug(end,end)/aug(end,end-1);
    for i=n-1:-1:1
        x(i) = (aug(i,end)-dot(aug(i,1:end-1),x))/aug(i,i);
    end
 
end