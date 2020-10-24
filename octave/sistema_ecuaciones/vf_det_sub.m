function x = vf_det_sub(A)
    [m, n] = size(A);
    x = 0;

    for(i = 1: n)
        subA = A(1: i, 1: i);
        detsubA = det(subA); 
        if (detsubA != 0)
            x = 1;
        else
            x = 0;
            break;
        end
    end
end

% A = [4, -2, 1; 20, -7, 12; -8, 13, 17]
% x = vf_det_sub(A)
