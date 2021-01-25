function [x, y, pn] = euler(f, a, b, N)
    h = (b - a) / (N - 1);
    x = a : h : b;
    y = [0.5];
    pn = 0;

    for (n = 1 : (N - 1))
        y(n + 1) = y(n) + h * f(x(n), y(n));
    end

    %pn = lagrange(x, y);
end

% f = @(x, y) y - x^2 + 1
% a = 0
% b = 2
% N = 11

% [x, y, pn] = euler(f, a, b, N)