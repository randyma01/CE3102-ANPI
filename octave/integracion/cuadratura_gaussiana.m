function I = cuadratura_gaussiana(f, a, b, n)
    syms x;
    [pol, ceros] = plegendre(n);
    expr = f;
    expr = subs(expr, x, ((b - a) / 2) * x + (( b + a) / 2));
    fx = matlabFunction(sym(expr));
    i = 1;
    res = 0;

    while(i <= n)
        res += fx(ceros(i));
        ++1;
    end

    I = res * ((b - a) / 2);
end

% f = @(x) log(x)
% a = 2
% b = 5
% n = 10

% I = cuadratura_gaussiana(f, a, b, n)