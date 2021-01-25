function [x, y, pn] = runge_kutta_orden_2(f, a, b, N)
    h = (b - a) / (N - 1);
    x = a : h : b;
    y = [0.5];
    pn = 0;

    for (n = 1 : (N - 1))
        k_1 = f(x(n), y(n))
        k_2 = f(x(n) + h/2, y(n) + h * k_1 / 2)
        y(n + 1) = y(n) + h * k_2
    end

    %pn = lagrange(x, y);
end

% f = @(x, y) y - x^2 + 1
% a = 0
% b = 2
% N = 11

% [x, y, pn] = runge_kutta_orden_2(f, a, b, N)