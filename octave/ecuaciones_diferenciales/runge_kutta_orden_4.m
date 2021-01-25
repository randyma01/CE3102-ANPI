function [x, y, pn] = runge_kutta_orden_4(f, a, b, y0, N)
    h = (b - a) / (N - 1);
    x = a : h : b;
    y = [0.5];
    pn = 0;

    for (n = 1 : (N - 1))
        k_1 = f(x(n), y(n));
        k_2 = f(x(n) + h/2, y(n) + h * k_1/2);
        k_3 = f(x(n) + h /2, y(n) + h * (k_2 / 2));
        k_4 = f(x(n) + h, y(n) + h * k_3);
        y(n + 1) = y(n) + (h / 6) * (k_1 + 2 * k_2 + 2 * k_3 + k_4);
    end

    %pn = lagrange(x, y);
end

% f = @(x, y) y - x^2 + 1
% a = 0
% b = 2
% y0 = 0.5
% N = 11

% [x, y, pn] = runge_kutta_orden_4(f, a, b, y0, N)