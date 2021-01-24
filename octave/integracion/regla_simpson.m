function [I, cota]= regla_simpson(f, a, b)
    syms x;
    var = sym('x');

    f1 = matlabFunction(sym(f));
    dfp = matlabFunction(diff(sym(f1)));
    dfs = matlabFunction(diff(sym(dfp)));
    dft = matlabFunction(diff(sym(dfs)));
    dfc = matlabFunction(diff(sym(dft)));

    h = (b - a) / 2;
    c = (a + b) / 2;

    s = solve(dfc, x);
    i = length(s);
    j = 1;
    ev = [];
    sa = abs(dfc(a));
    sb = abs(dfc(b));
    ev = [ev sa sb];
    
    while (j <= i)
        si = abs(dfc(s(i)));
        ev = [ev si];
        ++j
    end

    cota = ((h**5 / 90) * max(ev));
    I = (h / 3) * (f1(a) + (4 * f1(c)) + f1(b));
end

% a = 2
% b = 5
% f = @(x) log(x)

% [I, cota] = regla_simpson(f, a, b)