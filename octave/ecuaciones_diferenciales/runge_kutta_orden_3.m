function [x, y, pn] = runge_kutta_orden_3(f, a, b, y0, N)
    h = (b - a) / (N - 1);
    x = a : h : b;
    y = [y0];
    pn = 0;

    for (n = 1 : (N - 1))
        k_1 = f(x(n), y(n));
        k_2 = f(x(n) + h/2, y(n) + h * k_1/2);
        k_3 = f(x(n) + h, y(n) + h * (2 * k_2 - k_1));
        y(n + 1) = y(n) + (h / 6) * (k_1 + 4 * k_2 + k_3);
    end

    %pn = lagrange(x, y);
end

% f = @(x, y) y - x^2 + 1
% a = 0
% b = 2
% y0 = 0.5
% N = 11

% [x, y, pn] = runge_kutta_orden_3(f, a, b, y0, N)