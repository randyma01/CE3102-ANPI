function [r, k, error] = muller(f, x0, x1, x2, tol, iterMax)
    f1 = str2func(f); % 1
    % f1 = matlabFunction(sym(f));  % 2
    k = 0;
    error = tol + 1;
    e = [];

    while (tol < error && k < iterMax)
        a = (((x1-x2) * (f1(x0) - f1(x2))) - ((x0 - x2) * (f1(x1) - f1(x2)))) / ((x0 - x1) * (x0 - x2) * (x1 - x2));
        b = ((((x0 - x2).^2) * (f1(x1) - f1(x2))) - (((x1 - x2).^2) * (f1(x0) - f1(x2)))) / ((x0 - x1) * (x0 - x2) * (x1 - x2));
        c = f1(x2);
        dis = sqrt((b.^2) - 4 * a * c);

        if (b < 0)
            r = x2 - ((2 * c) / ( b - dis))
        else
            r = x2 - ((2 * c) / (b + dis))
        end

        error = abs(f1(r));
        e = [e error];
        d1 = abs(x0 - r);
        d2 = abs(x1 - r);
        d3 = abs(x2 - r);

        if(max([d1 d2 d3]) == d1)
            [s] = sort([r x1 x2]);
            x0 = s(1);
            x1 = s(2);
            x2 = s(3);
        elseif(max([d1 d2 d3]) == d2)
            [s] = sort([r x0 x2]);
            x0 = s(1);
            x1 = s(2);
            x2 = s(3);
        else
            [s] = sort([r x0 x1]);
            x0 = s(1);
            x1 = s(2);
            x2 = s(3);
        end
        ++k;
    end
    
    plot(1 : k, e)
    xlabel('iter (k)')
    ylabel('Error (|f(x_k)|)')
    title('Error del Metodo de Muller')
end

% 1
% [r, k ,error] = muller('@(x)sin(x)-x/2', 2, 2.2, 1.8, 10^-8, 3)

% 2 
% [r, k ,error] = muller(sin(x)-x/2, 2, 2.2, 1.8, 10^-8, 3)
